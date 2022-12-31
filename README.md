## Rasa conversational AI with graph_knowledgeBase

#### This chatbot uses the Rasa experimental feature : KnowledgeBase

- ##### A Neo4j graph database is integrated with the Rasa through the KnowledgeBase feature

Following files are contained,
- **data/nlu.md** contains training examples for the NLU model  
- **data/stories.md** contains training stories for the Core model  
- **actions.py** contains the custom action for querying the knowledge base
- **config.yml** contains the model configuration
- **domain.yml** contains the domain of the assistant  
- **endpoints.yml** contains the webhook configuration for the custom action  
- **knowledge_base_data.json** contains the data for the knowledge base


To train your knowledge base bot, execute
```
rasa train
```
This will store a zipped model file in `models/`.

Start the action server by
```
rasa run actions
```

To chat with the bot on the command line, run
```
rasa shell
```


