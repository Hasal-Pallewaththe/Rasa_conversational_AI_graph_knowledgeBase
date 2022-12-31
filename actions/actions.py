import logging
from typing import Text, Callable, Dict, List, Any
import yaml

from rasa_sdk.knowledge_base.actions import ActionQueryKnowledgeBase
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.interfaces import Tracker
from rasa_sdk.events import SlotSet
from rasa_sdk.knowledge_base.utils import (
    SLOT_OBJECT_TYPE,
    SLOT_LAST_OBJECT_TYPE,
    SLOT_ATTRIBUTE,
    reset_attribute_slots,
    SLOT_MENTION,
    SLOT_LAST_OBJECT,
    SLOT_LISTED_OBJECTS
    )
from rasa_sdk import utils
from rasa_sdk.knowledge_base.storage import KnowledgeBase
from py2neo import Graph


with open('credentials.yml',  'r') as info:
    credentials = yaml.safe_load(info)

with open('cypher_queries.yml', 'r') as info:
    cypher = yaml.safe_load(info)

logger = logging.getLogger(__name__)


class ChecklistData(KnowledgeBase):
    '''
    A rasa KnowledgeBase inherited class that can be
    used to connect the checklist graph database (neo4j)
    '''
    # Connection of the neo4j graph database
    graph = Graph(credentials['NEO4J_URL'],
                  auth=(credentials['NEO4J_USERNAME'],
                  credentials['NEO4J_PASSWORD']))

    def set_representation_function_of_object(
        self, object_type: Text, representation_function: Callable
    ) -> None:
        '''
        Set the representation function of the given object type.
        Args:
            object_type: the object type
            representation_function: the representation function
        '''
        self.representation_function[object_type] = representation_function

    def set_key_attribute_of_object(
        self, object_type: Text, key_attribute: Text
    ) -> None:
        '''
        Set the key attribute of the given object type.
        Args:
            object_type: the object type
            key_attribute: the name of the key attribute
        '''
        self.key_attribute[object_type] = key_attribute

    async def get_attributes_of_object(self, object_type: Text) -> List[Text]:
        '''
        Returns a list of all attributes that belong
        to the provided object type.
        Args:
            object_type: the object type
        Returns: list of attributes of object_type
        '''
        print("Get Attributes is Called")

        print("OBJECT TYPE=", object_type)

        '''
        To make sure the object_type is extracted and capitalized
        even if simple letters are used in the nlu data
        '''
        object_type = object_type.title()

        # retrieve objects (nodes in the graph database) data from the database
        if (object_type == 'Connected-Expert-Checklists'):
            # store nodes data in variable graph_nodes
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY1']))
        elif (object_type == 'Connected-Intermediate-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY2']))
        elif (object_type == 'Connected-Novice-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY3']))
        else:
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (r:{}) RETURN r".format(object_type)))

        # an empty list to store all received nodes
        extracted_graph_nodes = []
        # refrom the nodes data into python dict
        for index, graph_node in enumerate(graph_nodes):
            extracted_graph_nodes.append(list(graph_nodes[index])[0])

        # extract only the first node
        first_object = extracted_graph_nodes[0]
        # print the attributes of the object_type - error handling
        print("EXTRACTED IN GET ATTRIBUTES = {}".format(list(
                                        first_object.keys())))
        return list(first_object.keys())

    async def get_objects(
        self, object_type: Text,
        mention: Text,
        step_id: Text,
        key_node_id: List[Any]
    ) -> List[Dict[Text, Any]]:
        """
        Query the knowledge base for objects of the given type.
        Args:
            object_type: the object type
            mention: the entity mention used in the chat
            step_id: entity step_id used in the chat
            key_node_id: last object_type's key attribute
        Returns: list of objects
        """

        # A local variable to limit the number of objects returned
        limit = 10
        # Only the English languaged checklists are considered
        checklist_language = 'en'

        '''
        A binary variable to check the condition;
        request steps in the checklist
        '''
        set_step = False

        # Print statements for error handeling
        print("object_type =", object_type)
        print("mention =", mention)
        print("step_id =", step_id)

        '''
        To make sure the object_type is extracted and capitalized
        even if simple letters are used in the nlu data
        '''
        object_type = object_type.title()

        # retrieve objects data (nodes in the graph database) from the database
        if (object_type == 'Connected-Expert-Checklists'):
            # store nodes data in variable graph_nodes
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY4']))
        elif (object_type == 'Connected-Intermediate-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY5']))
        elif (object_type == 'Connected-Novice-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY6']))
        else:
            graph_nodes = \
                list(
                    ChecklistData.graph.run(
                        "MATCH (r:{}) RETURN r".format(object_type)))

        '''
        if mention entiry is not None, Knowledgebase class inbuild method
        ordinal_mention_mapping is used to obtain the checklist id
        ordinal_mention_mapping mehtod uses a lambda func to retrieve
        the last object_type's key attribute
        '''
        if mention:
            # variable key_node_id provides last object_type's key attribute
            checklist_id = self.ordinal_mention_mapping[mention](key_node_id)
        else:
            checklist_id = None

        # Print statements for error handeling
        print("checklist_id =", checklist_id)

        # A variable used to return current object_type safely
        new_object_type = object_type

        '''
        retrieve steps(and other data about the step; components, Defects etc)
        which are connected with a previouly mentioned checklist in the chat
        '''
        if ((object_type == 'Connected-Expert-Checklists') and (
                    step_id and checklist_id)):
            # store step nodes data in variable graph_nodes
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Expert'})"
                    "-[:SHOULD_PERFORM]->(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(r:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"})"
                    " RETURN r"))
            # store component nodes data in variable graph_nodes2
            graph_nodes2 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Expert'})"
                    "-[:SHOULD_PERFORM]->(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"})"
                    "-[:CONTAINS]->(r:Component) RETURN r"))
            # store Object nodes data in variable graph_nodes3
            graph_nodes3 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Expert'})"
                    "-[:SHOULD_PERFORM]->(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"})"
                    "-[:CONTAINS]->(:Component)-[:VERB {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"}]"
                    "->(r:Object) RETURN r"))
            # store Defect nodes data in variable graph_nodes4
            graph_nodes4 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Expert'})"
                    "-[:SHOULD_PERFORM]->(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"})"
                    "-[:CONTAINS]->(:Component)-[:VERB {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"}]->(:Object)"
                    "-[:NOT_FULFILLED {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"}]->(r:Defect) RETURN r"))
            # store Action nodes data in variable graph_nodes5
            graph_nodes5 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Expert'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"}]->(:Object)-[:HOW {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/E')+"}]->(r:Action) RETURN r"))

            '''
            change the variable to return the object_type as "Step"
            this is used to customized the display of data in the chatbot later
            '''
            new_object_type = "Step"

            '''
            Set the binary variable
            to check the condition;request steps in the checklist
            '''
            set_step = True

        elif ((object_type == 'Connected-Intermediate-Checklists') and (
                    step_id and checklist_id)):
            # store step nodes data in variable graph_nodes
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Intermediate'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(r:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"}) RETURN r"))
            # store component nodes data in variable graph_nodes2
            graph_nodes2 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Intermediate'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"})-[:CONTAINS]->"
                    "(r:Component) RETURN r"))
            # store Object nodes data in variable graph_nodes3
            graph_nodes3 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Intermediate'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"}]->(r:Object) RETURN r"))
            # store Defect nodes data in variable graph_nodes4
            graph_nodes4 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Intermediate'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"+repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"}]->(:Object)-"
                    "[:NOT_FULFILLED {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"}]->(r:Defect) RETURN r"))
            # store Action nodes data in variable graph_nodes5
            graph_nodes5 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Intermediate'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"+repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"+repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"}]->(:Object)-[:HOW {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/I')+"}]->(r:Action) RETURN r"))

            '''
            change the variable to return the object_type as "Step"
            this is used to customized the display of data in the chatbot later
            '''
            new_object_type = "Step"

            '''
            Set the binary variable
            to check the condition;request steps in the checklist
            '''
            set_step = True

        elif ((object_type == 'Connected-Novice-Checklists') and (
                    step_id and checklist_id)):
            # store step nodes data in variable graph_nodes
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Novice'})"
                    "-[:SHOULD_PERFORM]->(:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(r:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"})"
                    " RETURN r"))
            # store component nodes data in variable graph_nodes2
            graph_nodes2 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Novice'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"+repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"})-[:CONTAINS]->(r:Component)"
                    " RETURN r"))
            # store Object nodes data in variable graph_nodes3
            graph_nodes3 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Novice'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"+repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"+repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"}]->(r:Object) RETURN r"))
            # store Defect nodes data in variable graph_nodes4
            graph_nodes4 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Novice'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"+repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"+repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"}]->"
                    "(:Object)-[:NOT_FULFILLED {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"}]->(r:Defect) RETURN r"))
            # store Action nodes data in variable graph_nodes5
            graph_nodes5 = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Novice'})-[:SHOULD_PERFORM]->"
                    "(:Checklist {checklist_id:"+repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"})-[:CONTAINS]->(:Step {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"})-[:CONTAINS]->"
                    "(:Component)-[:VERB {step:"+repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"}]->(:Object)-[:HOW {step:"
                    + repr(step_id)+", checklist:"
                    + repr(checklist_id+'/'+checklist_language+'/N')+"}]->(r:Action) RETURN r"))

            '''
            change the variable to return the object_type as "Step"
            this is used to customized the display of data in the chatbot later
            '''
            new_object_type = "Step"

            '''
            Set the binary variable
            to check the condition;request steps in the checklist
            '''
            set_step = True

        # an empty list to store all received nodes
        extracted_graph_nodes = []

        # refrom the nodes data into python dict
        for index, graph_node in enumerate(graph_nodes):
            extracted_graph_nodes.append(dict(graph_node['r']))

        objects = extracted_graph_nodes

        # empty lists to store other data related to steps
        extracted_graph_nodes2 = []
        extracted_graph_nodes3 = []
        extracted_graph_nodes4 = []
        extracted_graph_nodes5 = []

        '''
        If steps data are requested in the chat,
        other data related to the step (components, actions, objects, Defects)
        are also listed together with the step
        '''
        if (set_step):
            # refrom the nodes data into python dict
            for index, graph_node in enumerate(graph_nodes2):
                extracted_graph_nodes2.append(dict(graph_node['r']))

            # refrom the nodes data into python dict
            for index, graph_node in enumerate(graph_nodes3):
                extracted_graph_nodes3.append(dict(graph_node['r']))

            # refrom the nodes data into python dict
            for index, graph_node in enumerate(graph_nodes4):
                extracted_graph_nodes4.append(dict(graph_node['r']))

            # refrom the nodes data into python dict
            for index, graph_node in enumerate(graph_nodes5):
                extracted_graph_nodes5.append(dict(graph_node['r']))

            objects.extend(extracted_graph_nodes2)
            objects.extend(extracted_graph_nodes3)
            objects.extend(extracted_graph_nodes4)
            objects.extend(extracted_graph_nodes5)

        return objects[:limit], new_object_type

    async def get_current_object_type(
        self, object_type: Text,
        mention: Text,
        step_id: Text,
        key_node_id: List[Any]
    ) -> List[Dict[Text, Any]]:
        """
        get the currently returned object_type to store it in slot history
        and to map in the lambda func
        Args:
            object_type: the object type
            mention: the entity mention used in the chat
            step_id: entity step_id used in the chat
            key_node_id: last object_type's key attribute

        Returns: list of objects
        """
        # Only the English languaged checklists are considered
        checklist_language = 'en'

        '''
        To make sure the object_type is extracted and capitalized
        even if simple letters are used in the nlu data
        '''
        object_type = object_type.title()

        # retrieve objects data (nodes in the graph database)
        if (object_type == 'Connected-Expert-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY22']))
        elif (object_type == 'Connected-Intermediate-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY23']))
        elif (object_type == 'Connected-Novice-Checklists'):
            graph_nodes = \
                list(ChecklistData.graph.run(cypher['QUERY24']))
        else:
            graph_nodes = \
                list(
                    ChecklistData.graph.run(
                        "MATCH (r:{}) RETURN r".format(object_type)))

        '''
        if mention entiry is not None, Knowledgebase class inbuild method
        ordinal_mention_mapping is used to obtain the checklist id
        ordinal_mention_mapping mehtod uses a lambda func to retrieve
        the last object_type's key attribute
        '''
        if mention:
            # variable key_node_id provides last object_type's key attribute
            checklist_id = self.ordinal_mention_mapping[mention](key_node_id)
        else:
            checklist_id = None

        '''
        retrieve only the steps node data
        which are connected with a previouly mentioned checklist in the chat
        '''
        if ((object_type == 'Connected-Expert-Checklists') and (
                    step_id and checklist_id)):
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Expert'})"
                    "-[:SHOULD_PERFORM]->(r:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"}) RETURN r"))

        elif ((object_type == 'Connected-Intermediate-Checklists') and (
                    step_id and checklist_id)):
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Intermediate'})"
                    "-[:SHOULD_PERFORM]->(r:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"}) RETURN r"))

        elif ((object_type == 'Connected-Novice-Checklists') and (
                    step_id and checklist_id)):
            graph_nodes = \
                list(ChecklistData.graph.run(
                    "MATCH (:User {expertise_level:'Novice'})"
                    "-[:SHOULD_PERFORM]->(r:Checklist {checklist_id:"
                    + repr(checklist_id)+", checklist_language:"
                    + repr(checklist_language)+"}) RETURN r"))

        # an empty list to store all received nodes
        extracted_graph_nodes = []
        # refrom the nodes data into python dict
        for index, graph_node in enumerate(graph_nodes):
            extracted_graph_nodes.append(dict(graph_node['r']))

        objects = extracted_graph_nodes

        return objects


class ActionChecklistData(ActionQueryKnowledgeBase):
    '''
    A custom action that inherits from ActionQueryKnowledgeBase
    class, this is used for the integration of knowledgebase
    into rasa actions

    '''
    def __init__(self):

        # instantiate the previously defined Knowledgebase class; ChecklistData
        knowledge_base = ChecklistData()

        '''
        use the set_representation_function_of_object method in
        the previously defined ChecklistData class, to customize
        the mention mapping using a lambda func
        here, corresponding key attributes are used to map different
        object_types
        '''
        knowledge_base.set_representation_function_of_object(
            object_type="Connected-Expert-Checklists",
            representation_function=lambda obj: obj["checklist_id"]
        )
        knowledge_base.set_representation_function_of_object(
            object_type="Connected-Intermediate-Checklists",
            representation_function=lambda obj: obj["checklist_id"]
        )
        knowledge_base.set_representation_function_of_object(
            object_type="Connected-Novice-Checklists",
            representation_function=lambda obj: obj["checklist_id"]
        )
        knowledge_base.set_representation_function_of_object(
            object_type="Checklist",
            representation_function=lambda obj: obj["checklist_id"]
        )
        knowledge_base.set_representation_function_of_object(
            object_type="User",
            representation_function=lambda obj: obj["expertise_level"]
        )
        knowledge_base.set_representation_function_of_object(
           object_type="Step",
           representation_function=lambda obj: obj["step"]
        )

        '''
        use the set_key_attribute_of_object method in
        the previously defined ChecklistData class, to define
        the key attributes of different object_types
        '''
        knowledge_base.set_key_attribute_of_object(
            object_type="Connected-Novice-Checklists",
            key_attribute="checklist_id"
        )
        knowledge_base.set_key_attribute_of_object(
            object_type="Connected-Intermediate-Checklists",
            key_attribute="checklist_id"
        )
        knowledge_base.set_key_attribute_of_object(
            object_type="Connected-Expert-Checklists",
            key_attribute="checklist_id"
        )
        knowledge_base.set_key_attribute_of_object(
            object_type="Checklist",
            key_attribute="checklist_id"
        )
        knowledge_base.set_key_attribute_of_object(
            object_type="User",
            key_attribute="expertise_level"
        )
        knowledge_base.set_key_attribute_of_object(
            object_type="Step",
            key_attribute="step"
        )
        knowledge_base.set_key_attribute_of_object(
            object_type="Defect",
            key_attribute="defect"
        )

        super().__init__(knowledge_base)

    async def utter_objects(
        self,
        dispatcher: CollectingDispatcher,
        object_type: Text,
        objects: List[Dict[Text, Any]],
        new_object_type: Text
    ) -> None:
        """
        Utters a response to the user that lists all found objects.
        Args:
            dispatcher: the dispatcher
            object_type: the object type
            objects: the list of objects
        """
        if objects:
            dispatcher.utter_message(
                text=f"Found following objects of type '{new_object_type}':"
            )

            print("new_object_type =", new_object_type)
            if (new_object_type == 'Step'):
                print(f"---------------- {new_object_type} ----------------")
                dispatcher.utter_message(
                        text=f"-------------- {new_object_type} --------------"
                    )
                dispatcher.utter_message(
                        text=(
                            f"{new_object_type} :-    " "{" f"step: {objects[0]['step']},"
                                                            " step_id: {objects[0]['step_id']}" "}")

                        )
                for i, obj in enumerate(objects[1:]):
                    print(f"{obj}")
                    dispatcher.utter_message(

                        text=("This step has: " f"{obj}")
                    )
            else:
                for i, obj in enumerate(objects):
                    print(f"{i+1} : {new_object_type} :- {obj}")
                    dispatcher.utter_message(
                        text=f"{i+1} : {new_object_type} :- {obj}"
                    )
        else:
            dispatcher.utter_message(
                text=f"I cann't find any objects of type '{new_object_type}'."
            )

    async def run(
        self,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> List[Dict[Text, Any]]:
        """
        Executes this action. If the user ask a question about checklists
        in the database, the knowledge base is queried for that checklists
        (_query_objects method is called). Then user can select one from the
        received list of checklists and ask several more questions related to
        that checklist. Here, graph database relationships are used to obtain
        the correct items inside a checklist.

        Args:
            dispatcher: the dispatcher
            tracker: the tracker
            domain: the domain

        Returns: list of slots

        """
        print("\n\n SLOT_OBJECT_TYPE={}".format(SLOT_OBJECT_TYPE))
        object_type = tracker.get_slot(SLOT_OBJECT_TYPE)
        last_object_type = tracker.get_slot(SLOT_LAST_OBJECT_TYPE)
        attribute = tracker.get_slot(SLOT_ATTRIBUTE)

        new_request = object_type != last_object_type

        print("Object Type={}, Attribute={} in Run".format(
                                    object_type, attribute))

        if not object_type:
            # object type always needs to be set as this is needed to query the
            # knowledge base
            dispatcher.utter_message(template="utter_ask_rephrase")
            return []

        if not attribute or new_request:
            print("Going to call _query_objects in Run")
            return await utils.call_potential_coroutine(
                self._query_objects(dispatcher, tracker))
        elif attribute:
            print("Going to call _query_attribute in Run")
            # logger.debug("Going to call _query_attribute in Run")
            return await utils.call_potential_coroutine(
                self._query_attribute(dispatcher, tracker))

        print("Going to dispatch Utter Rephrase in Run")
        logger.debug("Going to dispatch Utter Rephrase in Run")
        dispatcher.utter_message(template="utter_ask_rephrase")
        return []

    async def _query_objects(
        self, dispatcher: CollectingDispatcher, tracker: Tracker
    ) -> List[Dict]:
        """
        Queries the knowledge base for objects of the requested object type and
        outputs those to the user. The objects are filtered by relationships
        in the grah databse the user mentioned in the request. furthermore,
        attributes can also be used to filter objects.

        Args:
            dispatcher: the dispatcher
            tracker: the tracker

        Returns: list of slots
        """
        object_type = tracker.get_slot(SLOT_OBJECT_TYPE)
        mention = tracker.get_slot(SLOT_MENTION)
        step_id = tracker.get_slot("step_id")

        '''
        variable key_node_id to store a list of
        last object_type's key attributes
        '''
        key_node_id = tracker.get_slot(SLOT_LISTED_OBJECTS)
        # print statement for error handling
        print("key_node_id =", key_node_id)

        object_attributes = await utils.call_potential_coroutine(
            self.knowledge_base.get_attributes_of_object(
                object_type
            ))

        objects, new_object_type = await utils.call_potential_coroutine(
            self.knowledge_base.get_objects(
                object_type, mention, step_id, key_node_id))

        objects_history = await utils.call_potential_coroutine(
            self.knowledge_base.get_current_object_type(
                object_type, mention, step_id, key_node_id))

        await utils.call_potential_coroutine(
            self.utter_objects(
                dispatcher, object_type, objects, new_object_type))

        if not objects:
            return reset_attribute_slots(tracker, object_attributes)

        if utils.call_potential_coroutine(
                            self.knowledge_base.get_key_attribute_of_object):
            key_attribute = \
                await self.knowledge_base.get_key_attribute_of_object(
                    object_type
                )
        else:
            key_attribute = self.knowledge_base.get_key_attribute_of_object(
                object_type
            )

        last_object = None if len(objects) > 1 else objects[0][key_attribute]
        # print statements for error handling
        print("key_attribute =", key_attribute)
        print("objects = ", objects)

        # store the chatbot history by setting the slots
        slots = [
            SlotSet(SLOT_OBJECT_TYPE, object_type),
            SlotSet(SLOT_MENTION, None),
            SlotSet(SLOT_ATTRIBUTE, None),
            SlotSet(SLOT_LAST_OBJECT, last_object),
            SlotSet(SLOT_LAST_OBJECT_TYPE, object_type),
            SlotSet(SLOT_LISTED_OBJECTS,
                    list(map(lambda e: e[key_attribute], objects_history)))
        ]

        return slots + reset_attribute_slots(tracker, object_attributes)
