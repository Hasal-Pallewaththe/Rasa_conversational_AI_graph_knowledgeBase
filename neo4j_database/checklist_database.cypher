// neo4j graph database for ZHT_Checklist_202042010xxxxxxxxx_xxxxxxxxxxxx_BR v1
// using Cypher Query Language

// Please delete all existing graphs using the following line
// MATCH (n) DETACH DELETE (n)
// please observe all nodes using the following line
// MATCH (n) RETURN (n)


// ................... Expertise ........................
CREATE (E: User {expertise_level: 'Expert'})

//........................ list one......................
CREATE (L1: Checklist {
    checklist_id: '11',
    checklist_language: 'en',
    first_step: '1',
    last_step: '13'})

//......................Steps............................
CREATE (T1: Step {step: '1', step_id: '1', checklist: '11/en/E'})
CREATE (T2: Step {step: '2', step_id: '2', checklist: '11/en/E'})
CREATE (T3: Step {step: '3', step_id: '3', checklist: '11/en/E'})
CREATE (T4: Step {step: '4', step_id: '4', checklist: '11/en/E'})
CREATE (T5: Step {step: '5', step_id: '5', checklist: '11/en/E'})
CREATE (T6: Step {step: '6', step_id: '6', checklist: '11/en/E'})
CREATE (T7: Step {step: '7', step_id: '7', checklist: '11/en/E'})
CREATE (T8: Step {step: '8', step_id: '8', checklist: '11/en/E'})
CREATE (T9: Step {step: '9', step_id: '9', checklist: '11/en/E'})
CREATE (T10: Step {step: '10', step_id: '10', checklist: '11/en/E'})
CREATE (T11: Step {step: '11', step_id: '11', checklist: '11/en/E'})
CREATE (T12: Step {step: '12', step_id: '12', checklist: '11/en/E'})
CREATE (T13: Step {step: '13', step_id: '13', checklist: '11/en/E'})
CREATE (T14: Step {step: '14', step_id: '14', checklist: '11/en/E'}),


//......................step relationships ............................
(T1)-[:HAS_NEXT_STEP] -> (T2), (T2)-[:HAS_PREVIOUS_STEP] -> (T1),
(T2)-[:HAS_NEXT_STEP] -> (T3), (T3)-[:HAS_PREVIOUS_STEP] -> (T2),
(T3)-[:HAS_NEXT_STEP] -> (T4), (T4)-[:HAS_PREVIOUS_STEP] -> (T3),
(T4)-[:HAS_NEXT_STEP] -> (T5), (T5)-[:HAS_PREVIOUS_STEP] -> (T4),
(T5)-[:HAS_NEXT_STEP] -> (T6), (T6)-[:HAS_PREVIOUS_STEP] -> (T5),
(T6)-[:HAS_NEXT_STEP] -> (T7), (T7)-[:HAS_PREVIOUS_STEP] -> (T6),
(T7)-[:HAS_NEXT_STEP] -> (T8), (T8)-[:HAS_PREVIOUS_STEP] -> (T7),
(T8)-[:HAS_NEXT_STEP] -> (T9), (T9)-[:HAS_PREVIOUS_STEP] -> (T8),
(T9)-[:HAS_NEXT_STEP] -> (T10), (T10)-[:HAS_PREVIOUS_STEP] -> (T9),
(T10)-[:HAS_NEXT_STEP] -> (T11), (T11)-[:HAS_PREVIOUS_STEP] -> (T10),
(T11)-[:HAS_NEXT_STEP] -> (T12), (T12)-[:HAS_PREVIOUS_STEP] -> (T11),
(T12)-[:HAS_NEXT_STEP] -> (T13), (T13)-[:HAS_PREVIOUS_STEP] -> (T12),
(T13)-[:HAS_NEXT_STEP] -> (T14), (T14)-[:HAS_PREVIOUS_STEP] -> (T13),
(T14)-[:HAS_NEXT_STEP] -> (T1),

//..............expert and checklist relationships.........................................
(E)-[:SHOULD_PERFORM] -> (L1),

(L1)-[:CONTAINS] -> (T1), (L1)-[:CONTAINS] -> (T2), (L1)-[:CONTAINS] -> (T3),
(L1)-[:CONTAINS] -> (T4), (L1)-[:CONTAINS] -> (T5), (L1)-[:CONTAINS] -> (T6),
(L1)-[:CONTAINS] -> (T7), (L1)-[:CONTAINS] -> (T8), (L1)-[:CONTAINS] -> (T9),
(L1)-[:CONTAINS] -> (T10), (L1)-[:CONTAINS] -> (T11), (L1)-[:CONTAINS] -> (T12),
(L1)-[:CONTAINS] -> (T13), (L1)-[:CONTAINS] -> (T14);

// ............................Step- 1................
MERGE (T: Step {step: '1', step_id: '1', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Wrong labels, bad printing quality'
    })
MERGE (O: Object {
    objective: 'Right labels, good printing quality'
    })
MERGE (A: Action {
    action: 'Inspect visually, use the info systems'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '1', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '1', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '1', checklist: '11/en/E'}] -> (D);


// ....................Step- 2................................
MERGE (T: Step {step: '2', step_id: '2', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Installation KIT'
    })
MERGE (D: Defect {
    defect: 'Wrong Installation KIT'
    })
MERGE (O: Object {
    objective: 'Right parts according to the bill of materials for quantity and aesthetical point of view'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '2', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '2', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '2', checklist: '11/en/E'}] -> (D);


// ....................Step- 3................................
MERGE (T: Step {step: '3', step_id: '3', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Packaging'
    })
MERGE (D: Defect {
    defect: 'Damages, stain, broken parts'
    })
MERGE (O: Object {
    objective: 'Integrity of components, right symbols'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '3', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '3', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '3', checklist: '11/en/E'}] -> (D);


// ....................Step- 4................................
MERGE (T: Step {step: '4', step_id: '4', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Test mode'
    })
MERGE (D: Defect {
    defect: 'Test mode failure'
    })
MERGE (O: Object {
    objective: 'Test mode inspection successful'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '4', what: 'activate', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '4', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '4', checklist: '11/en/E'}] -> (D);


// ....................Step- 5................................
MERGE (T: Step {step: '5', step_id: '5', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Board wrong setting'
    })
MERGE (O: Object {
    objective: 'All functions are present in product'
    })
MERGE (A: Action {
    action: 'Use Instruction for Use to match described functions with physical functions on product'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '5', what: 'control', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '5', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '5', checklist: '11/en/E'}] -> (D);


// ....................Step- 6................................
MERGE (T: Step {step: '6', step_id: '6', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'Product have not leak of mw'
    })
MERGE (A: Action {
    action: 'Set product on MW function at the top of power with becker on water inside and test it with leak tester following verification path'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '6', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '6', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '6', checklist: '11/en/E'}] -> (D);


// ....................Step- 7................................
MERGE (T: Step {step: '7', step_id: '7', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Product not in according with the bill of materials, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Control panel has to match with 12nc of product'
    })
MERGE (A: Action {
    action: 'Check correspondence in COALA tablet and verify the control panel is complete, correct, well assembled and properly functioning'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '7', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '7', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '7', checklist: '11/en/E'}] -> (D);


// ....................Step- 8................................
MERGE (T: Step {step: '8', step_id: '8', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Product not following the bill of materials, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Door has to match with 12nc of product'
    })
MERGE (A: Action {
    action: 'Check correspondence in COALA tablet and verify that the door is complete, correct, well assembled, and is properly functioning'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '8', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '8', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '8', checklist: '11/en/E'}] -> (D);


// ....................Step- 9................................
MERGE (T: Step {step: '9', step_id: '9', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, enammeling issues'
    })
MERGE (O: Object {
    objective: 'Product cavity does not have aesthetical issues'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '9', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '9', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '9', checklist: '11/en/E'}] -> (D);


// ....................Step- 10................................
MERGE (T: Step {step: '10', step_id: '10', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'External covers'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, missing parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'External covers do not have aesthetical issues and are well assembled'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions and check correspondence in COALA tablet in case of doubt'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '10', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '10', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '10', checklist: '11/en/E'}] -> (D);


// ....................Step- 11................................
MERGE (T: Step {step: '11', step_id: '11', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Accessories'
    })
MERGE (D: Defect {
    defect: 'Missing parts, broken parts, damages, wrong parts'
    })
MERGE (O: Object {
    objective: 'Accessories do not have aesthetical defect and have to be according to the bill of materials'
    })
MERGE (A: Action {
    action: 'Check correspondence in COALA tablet and verify the aesthetical quality of the accessories set'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '11', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '11', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '11', checklist: '11/en/E'}] -> (D);


// ....................Step- 12................................
MERGE (T: Step {step: '12', step_id: '12', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Noise'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, defective parts'
    })
MERGE (O: Object {
    objective: 'Product noise is noise out of specifications'
    })
MERGE (A: Action {
    action: 'Hear the product during function'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '12', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '12', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '12', checklist: '11/en/E'}] -> (D);


// ....................Step- 13................................
MERGE (T: Step {step: '13', step_id: '13', checklist: '11/en/E'})

MERGE (C: Component {
    component: 'Plug'
    })
MERGE (D: Defect {
    defect: 'Missing parts, broken parts, damages, wrong parts'
    })
MERGE (O: Object {
    objective: 'Plug is present according to the bill of materials and not damaged'
    })
MERGE (A: Action {
    action: 'Check correspondence in COALA tablet and verify aesthetical quality'
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '13', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '13', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '13', checklist: '11/en/E'}] -> (D);


// ....................Step- 14 (an empty placeholder)................................
MERGE (T: Step {step: '14', step_id: '14', checklist: '11/en/E'})

MERGE (C: Component {
    component: ''
    })
MERGE (D: Defect {
    defect: ''
    })
MERGE (O: Object {
    objective: ''
    })
MERGE (A: Action {
    action: ''
    })

// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '14', what: 'verify', checklist: '11/en/E'}] -> (O),
(O)-[:HOW {step: '14', checklist: '11/en/E'}] -> (A), (O)-[:NOT_FULFILLED {step: '14', checklist: '11/en/E'}] -> (D);


// next checklist for the intermediate expertise_level

// ................... Expertise ........................
CREATE (E: User {expertise_level: 'Intermediate'})

//........................ list one......................
CREATE (L1: Checklist {
    checklist_id: '1',
    checklist_language: 'en',
    first_step: '1',
    last_step: '28'})

//......................Steps............................
CREATE (T1: Step {step: '1', step_id: '1.1', checklist: '1/en/I'})
CREATE (T2: Step {step: '2', step_id: '1.2', checklist: '1/en/I'})
CREATE (T3: Step {step: '3', step_id: '1.3', checklist: '1/en/I'})

CREATE (T4: Step {step: '4', step_id: '2.1', checklist: '1/en/I'})

CREATE (T5: Step {step: '5', step_id: '3.1', checklist: '1/en/I'})

CREATE (T6: Step {step: '6', step_id: '4.1', checklist: '1/en/I'})

CREATE (T7: Step {step: '7', step_id: '5.1', checklist: '1/en/I'})

CREATE (T8: Step {step: '8', step_id: '6.1', checklist: '1/en/I'})
CREATE (T9: Step {step: '9', step_id: '6.2', checklist: '1/en/I'})
CREATE (T10: Step {step: '10', step_id: '6.3', checklist: '1/en/I'})

CREATE (T11: Step {step: '11', step_id: '7.1', checklist: '1/en/I'})
CREATE (T12: Step {step: '12', step_id: '7.2', checklist: '1/en/I'})
CREATE (T13: Step {step: '13', step_id: '7.3', checklist: '1/en/I'})
CREATE (T14: Step {step: '14', step_id: '7.4', checklist: '1/en/I'})
CREATE (T15: Step {step: '15', step_id: '7.5', checklist: '1/en/I'})

CREATE (T16: Step {step: '16', step_id: '8.1', checklist: '1/en/I'})
CREATE (T17: Step {step: '17', step_id: '8.2', checklist: '1/en/I'})
CREATE (T18: Step {step: '18', step_id: '8.3', checklist: '1/en/I'})
CREATE (T19: Step {step: '19', step_id: '8.4', checklist: '1/en/I'})
CREATE (T20: Step {step: '20', step_id: '8.5', checklist: '1/en/I'})
CREATE (T21: Step {step: '21', step_id: '8.6', checklist: '1/en/I'})
CREATE (T22: Step {step: '22', step_id: '8.7', checklist: '1/en/I'})
CREATE (T23: Step {step: '23', step_id: '8.8', checklist: '1/en/I'})

CREATE (T24: Step {step: '24', step_id: '9.1', checklist: '1/en/I'})

CREATE (T25: Step {step: '25', step_id: '10.1', checklist: '1/en/I'})

CREATE (T26: Step {step: '26', step_id: '11.1', checklist: '1/en/I'})

CREATE (T27: Step {step: '27', step_id: '12.1', checklist: '1/en/I'})

CREATE (T28: Step {step: '28', step_id: '13.1', checklist: '1/en/I'})

// empty step (empty placeholder)
CREATE (T29: Step {step: '29', step_id: '14.1', checklist: '1/en/I'}),

//......................step relationships ............................
(T1)-[:HAS_NEXT_STEP] -> (T2), (T2)-[:HAS_PREVIOUS_STEP] -> (T1),
(T2)-[:HAS_NEXT_STEP] -> (T3), (T3)-[:HAS_PREVIOUS_STEP] -> (T2),
(T3)-[:HAS_NEXT_STEP] -> (T4), (T4)-[:HAS_PREVIOUS_STEP] -> (T3),
(T4)-[:HAS_NEXT_STEP] -> (T5), (T5)-[:HAS_PREVIOUS_STEP] -> (T4),
(T5)-[:HAS_NEXT_STEP] -> (T6), (T6)-[:HAS_PREVIOUS_STEP] -> (T5),
(T6)-[:HAS_NEXT_STEP] -> (T7), (T7)-[:HAS_PREVIOUS_STEP] -> (T6),
(T7)-[:HAS_NEXT_STEP] -> (T8), (T8)-[:HAS_PREVIOUS_STEP] -> (T7),
(T8)-[:HAS_NEXT_STEP] -> (T9), (T9)-[:HAS_PREVIOUS_STEP] -> (T8),
(T9)-[:HAS_NEXT_STEP] -> (T10), (T10)-[:HAS_PREVIOUS_STEP] -> (T9),
(T10)-[:HAS_NEXT_STEP] -> (T11), (T11)-[:HAS_PREVIOUS_STEP] -> (T10),
(T11)-[:HAS_NEXT_STEP] -> (T12), (T12)-[:HAS_PREVIOUS_STEP] -> (T11),
(T12)-[:HAS_NEXT_STEP] -> (T13), (T13)-[:HAS_PREVIOUS_STEP] -> (T12),
(T13)-[:HAS_NEXT_STEP] -> (T14), (T14)-[:HAS_PREVIOUS_STEP] -> (T13),
(T14)-[:HAS_NEXT_STEP] -> (T15), (T15)-[:HAS_PREVIOUS_STEP] -> (T14),
(T15)-[:HAS_NEXT_STEP] -> (T16), (T16)-[:HAS_PREVIOUS_STEP] -> (T15),
(T16)-[:HAS_NEXT_STEP] -> (T17), (T17)-[:HAS_PREVIOUS_STEP] -> (T16),
(T17)-[:HAS_NEXT_STEP] -> (T18), (T18)-[:HAS_PREVIOUS_STEP] -> (T17),
(T18)-[:HAS_NEXT_STEP] -> (T19), (T19)-[:HAS_PREVIOUS_STEP] -> (T18),
(T19)-[:HAS_NEXT_STEP] -> (T20), (T20)-[:HAS_PREVIOUS_STEP] -> (T19),
(T20)-[:HAS_NEXT_STEP] -> (T21), (T21)-[:HAS_PREVIOUS_STEP] -> (T20),
(T21)-[:HAS_NEXT_STEP] -> (T22), (T22)-[:HAS_PREVIOUS_STEP] -> (T21),
(T22)-[:HAS_NEXT_STEP] -> (T23), (T23)-[:HAS_PREVIOUS_STEP] -> (T22),
(T23)-[:HAS_NEXT_STEP] -> (T24), (T24)-[:HAS_PREVIOUS_STEP] -> (T23),
(T24)-[:HAS_NEXT_STEP] -> (T25), (T25)-[:HAS_PREVIOUS_STEP] -> (T24),
(T25)-[:HAS_NEXT_STEP] -> (T26), (T26)-[:HAS_PREVIOUS_STEP] -> (T25),
(T26)-[:HAS_NEXT_STEP] -> (T27), (T27)-[:HAS_PREVIOUS_STEP] -> (T26),
(T27)-[:HAS_NEXT_STEP] -> (T28), (T28)-[:HAS_PREVIOUS_STEP] -> (T27),
(T28)-[:HAS_NEXT_STEP] -> (T29), (T29)-[:HAS_PREVIOUS_STEP] -> (T28),
(T29)-[:HAS_NEXT_STEP] -> (T1),

//..............Expertise and checklist relationships.........................................
(E)-[:SHOULD_PERFORM] -> (L1),

(L1)-[:CONTAINS] -> (T1), (L1)-[:CONTAINS] -> (T2), (L1)-[:CONTAINS] -> (T3),
(L1)-[:CONTAINS] -> (T4), (L1)-[:CONTAINS] -> (T5), (L1)-[:CONTAINS] -> (T6),
(L1)-[:CONTAINS] -> (T7), (L1)-[:CONTAINS] -> (T8), (L1)-[:CONTAINS] -> (T9),
(L1)-[:CONTAINS] -> (T10), (L1)-[:CONTAINS] -> (T11), (L1)-[:CONTAINS] -> (T12),
(L1)-[:CONTAINS] -> (T13), (L1)-[:CONTAINS] -> (T14), (L1)-[:CONTAINS] -> (T15),
(L1)-[:CONTAINS] -> (T16), (L1)-[:CONTAINS] -> (T17), (L1)-[:CONTAINS] -> (T18),
(L1)-[:CONTAINS] -> (T19), (L1)-[:CONTAINS] -> (T20), (L1)-[:CONTAINS] -> (T21),
(L1)-[:CONTAINS] -> (T22), (L1)-[:CONTAINS] -> (T23), (L1)-[:CONTAINS] -> (T24),
(L1)-[:CONTAINS] -> (T25), (L1)-[:CONTAINS] -> (T26), (L1)-[:CONTAINS] -> (T27),
(L1)-[:CONTAINS] -> (T28), (L1)-[:CONTAINS] -> (T29);


// ............................Step- 1.1................
MERGE (T: Step {step: '1', step_id: '1.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Wrong labels data'
    })
MERGE (O: Object {
    objective: 'Right labels data'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '1', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '1', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '1', checklist: '1/en/I'}] -> (D);


// ............................Step- 1.2................
MERGE (T: Step {step: '2', step_id: '1.2', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Bad printing quality'
    })
MERGE (O: Object {
    objective: 'Clear printing and integrity of all the labels'
    })
MERGE (A: Action {
    action: 'Check visually all the labels'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '2', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '2', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '2', checklist: '1/en/I'}] -> (D);


// ............................Step- 1.3................
MERGE (T: Step {step: '3', step_id: '1.3', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Wrong Instruction for Use'
    })
MERGE (O: Object {
    objective: 'Right Instruction for Use'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '3', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '3', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '3', checklist: '1/en/I'}] -> (D);


// ............................Step- 2.1................
MERGE (T: Step {step: '4', step_id: '2.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Installation KIT'
    })
MERGE (D: Defect {
    defect: 'Wrong Installation KIT'
    })
MERGE (O: Object {
    objective: 'Right parts according to bill of material for quantity and aesthetical point of view'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA HMI ( tablet)'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '4', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '4', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '4', checklist: '1/en/I'}] -> (D);


// ............................Step- 3.1................
MERGE (T: Step {step: '5', step_id: '3.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Packaging'
    })
MERGE (D: Defect {
    defect: 'Damages; stain, broken parts'
    })
MERGE (O: Object {
    objective: 'Integrity of components, right symbols'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '5', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '5', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '5', checklist: '1/en/I'}] -> (D);


// ............................Step- 4.1................
MERGE (T: Step {step: '6', step_id: '4.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Test mode'
    })
MERGE (D: Defect {
    defect: 'Test mode failure'
    })
MERGE (O: Object {
    objective: 'Test mode inspection successful'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '6', what: 'activate', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '6', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '6', checklist: '1/en/I'}] -> (D);


// ............................Step- 5.1................
MERGE (T: Step {step: '7', step_id: '5.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Board wrong setting'
    })
MERGE (O: Object {
    objective: 'All functions are present in product'
    })
MERGE (A: Action {
    action: 'Use Instruction for Use to match described functions with phisical functions on product'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '7', what: 'control', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '7', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '7', checklist: '1/en/I'}] -> (D);


// ............................Step- 6.1................
MERGE (T: Step {step: '8', step_id: '6.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'MW front leakeges test mode'
    })
MERGE (A: Action {
    action: 'Intoduce becker with water in the cavity'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '8', what: 'prepare', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '8', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '8', checklist: '1/en/I'}] -> (D);


// ............................Step- 6.2................
MERGE (T: Step {step: '9', step_id: '6.2', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'No Front leakeges'
    })
MERGE (A: Action {
    action: 'Move tester along defined path and check values lower than 5 mW/cm +/-2%'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '9', what: 'measure', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '9', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '9', checklist: '1/en/I'}] -> (D);


// ............................Step- 6.3................
MERGE (T: Step {step: '10', step_id: '6.3', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'Rear leakeges test mode'
    })
MERGE (A: Action {
    action: 'Move tester along defined path and check values lower than 5 mW/cm +/-2%'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '10', what: 'prepare', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '10', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '10', checklist: '1/en/I'}] -> (D);


// ............................Step- 7.1................
MERGE (T: Step {step: '11', step_id: '7.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Control panel has to match with 12nc of product'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '11', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '11', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '11', checklist: '1/en/I'}] -> (D);


// ............................Step- 7.2................
MERGE (T: Step {step: '12', step_id: '7.2', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Scratch, dent, dirty'
    })
MERGE (O: Object {
    objective: 'Control panel has to match aesthetical requirement'
    })
MERGE (A: Action {
    action: 'Inspect visually control panel according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '12', what: 'verify'}] -> (O),
(O)-[:HOW {step: '12'}] -> (A), (O)-[:NOT_FULFILLED {step: '12'}] -> (D);


// ............................Step- 7.3................
MERGE (T: Step {step: '13', step_id: '7.3', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Serigraphy defects, bad adhesion, smudges, fade, shadows, burrs'
    })
MERGE (O: Object {
    objective: 'Serigraphy have to match aesthetical requirement'
    })
MERGE (A: Action {
    action: 'Check visually and test with adhesive tape'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '13', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '13', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '13', checklist: '1/en/I'}] -> (D);


// ............................Step- 7.4................
MERGE (T: Step {step: '14', step_id: '7.4', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'No screw, screw non fixed, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Control panel has to be fix on his support'
    })
MERGE (A: Action {
    action: 'Inspect visually and try to pull control panel to test fixation on its base'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '14', what: 'control', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '14', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '14', checklist: '1/en/I'}] -> (D);


// ............................Step- 7.5................
MERGE (T: Step {step: '15', step_id: '7.5', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Components damage, color mismatch, serigraphy defects, allignement of indicators on knob, bas assembly'
    })
MERGE (O: Object {
    objective: 'Control panel components (buttons, knobs, and displays) have to match aesthetical and functional requirements'
    })
MERGE (A: Action {
    action: 'Inspect visually components according to aesthetical catalog definitions and product pictures'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '15', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '15', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '15', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.1................
MERGE (T: Step {step: '16', step_id: '8.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Outer door is matching with 12nc of product'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '16', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '16', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '16', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.2................
MERGE (T: Step {step: '17', step_id: '8.2', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Scratch, dent, dirty'
    })
MERGE (O: Object {
    objective: 'Outer door is matching aesthetical requirement'
    })
MERGE (A: Action {
    action: 'Inspect visually outer door according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '17', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '17', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '17', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.3................
MERGE (T: Step {step: '18', step_id: '8.3', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Serigraphy defects, Bad adhesion, smudges, fade, shadows, burrs'
    })
MERGE (O: Object {
    objective: 'Serigraphy have to match aesthetical requirement'
    })
MERGE (A: Action {
    action: 'Check visually and test with adhesive tape'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '18', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '18', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '18', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.4................
MERGE (T: Step {step: '19', step_id: '8.4', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'No screw, screw non fixed, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Door assembly is complete and door parts have to be fixed and well assembed'
    })
MERGE (A: Action {
    action: 'Inspect visually and try to pull the handle to test fixation on its base'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '19', what: 'control', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '19', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '19', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.5................
MERGE (T: Step {step: '20', step_id: '8.5', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Components damage, color mismatch of colour, bad assembly'
    })
MERGE (O: Object {
    objective: 'Door handle is matching aesthetical requrements'
    })
MERGE (A: Action {
    action: 'Inspect visually handle according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '20', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '20', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '20', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.6................
MERGE (T: Step {step: '21', step_id: '8.6', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Hinges and door opening are well assembled'
    })
MERGE (A: Action {
    action: 'Open the door and verify sound and forces'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '21', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '21', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '21', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.7................
MERGE (T: Step {step: '22', step_id: '8.7', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Aestetical defects, bad assembly, missing parts wrong parts'
    })
MERGE (O: Object {
    objective: 'No scratches or other aesthetical defects on innerdoor'
    })
MERGE (A: Action {
    action: 'Inspect visually innerdoor according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '22', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '22', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '22', checklist: '1/en/I'}] -> (D);


// ............................Step- 8.8................
MERGE (T: Step {step: '23', step_id: '8.8', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, wrong parts, damages'
    })
MERGE (O: Object {
    objective: 'Door lock presence according to bill of material and right functionality'
    })
MERGE (A: Action {
    action: 'Test door lock and check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '23', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '23', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '23', checklist: '1/en/I'}] -> (D);


// ............................Step- 9.1................
MERGE (T: Step {step: '24', step_id: '9.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, enammeling issues'
    })
MERGE (O: Object {
    objective: 'Product cavity does not have aesthetical issues'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '24', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '24', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '24', checklist: '1/en/I'}] -> (D);


// ............................Step- 10.1................
MERGE (T: Step {step: '25', step_id: '10.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'External covers'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, missing parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'External covers do not have aesthetical issues and are well assembled'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions and check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '25', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '25', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '25', checklist: '1/en/I'}] -> (D);


// ............................Step- 11.1................
MERGE (T: Step {step: '26', step_id: '11.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Accessories'
    })
MERGE (D: Defect {
    defect: 'Missing parts, broken parts, damages, wrong parts'
    })
MERGE (O: Object {
    objective: 'Accesories do not have aesthetical defect and have to be according to bill of material'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet and verify aestetical quality of the accessories set'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '26', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '26', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '26', checklist: '1/en/I'}] -> (D);


// ............................Step- 12.1................
MERGE (T: Step {step: '27', step_id: '12.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Noise'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, defective parts'
    })
MERGE (O: Object {
    objective: 'Product noise is noise out of specifications'
    })
MERGE (A: Action {
    action: 'Hear the  product during function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '27', what: 'Control', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '27', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '27', checklist: '1/en/I'}] -> (D);


// ............................Step- 13.1................
MERGE (T: Step {step: '28', step_id: '13.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: 'Plug'
    })
MERGE (D: Defect {
    defect: 'Missing parts, broken parts, damages, wrong parts'
    })
MERGE (O: Object {
    objective: 'Plug is present according to bill of material and not damaged'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet and verify aestetical quality'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '28', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '28', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '28', checklist: '1/en/I'}] -> (D);


// ............................Step- 14.1(empty placeholder)................
MERGE (T: Step {step: '29', step_id: '14.1', checklist: '1/en/I'})

MERGE (C: Component {
    component: ''
    })
MERGE (D: Defect {
    defect: ''
    })
MERGE (O: Object {
    objective: ''
    })
MERGE (A: Action {
    action: ''
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '29', what: 'verify', checklist: '1/en/I'}] -> (O),
(O)-[:HOW {step: '29', checklist: '1/en/I'}] -> (A), (O)-[:NOT_FULFILLED {step: '29', checklist: '1/en/I'}] -> (D);


// next checklist for the novice expertise_level

// ................... Expertise ........................
CREATE (E: User {expertise_level: 'Novice'})

//........................ list one......................
CREATE (L1: Checklist {
    checklist_id: '1',
    checklist_language: 'en',
    first_step: '1',
    last_step: '89'})

//......................Steps............................
CREATE (T1: Step {step: '1', step_id: '1.1.1', checklist: '1/en/N'})
CREATE (T2: Step {step: '2', step_id: '1.1.2', checklist: '1/en/N'})
CREATE (T3: Step {step: '3', step_id: '1.1.3', checklist: '1/en/N'})

CREATE (T4: Step {step: '4', step_id: '1.2.1', checklist: '1/en/N'})
CREATE (T5: Step {step: '5', step_id: '1.2.2', checklist: '1/en/N'})
CREATE (T6: Step {step: '6', step_id: '1.2.3', checklist: '1/en/N'})
CREATE (T7: Step {step: '7', step_id: '1.2.4', checklist: '1/en/N'})

CREATE (T8: Step {step: '8', step_id: '1.3.1', checklist: '1/en/N'})
CREATE (T9: Step {step: '9', step_id: '1.3.2', checklist: '1/en/N'})

CREATE (T10: Step {step: '10', step_id: '2.1.1', checklist: '1/en/N'})
CREATE (T11: Step {step: '11', step_id: '2.1.2', checklist: '1/en/N'})

CREATE (T12: Step {step: '12', step_id: '3.1.1', checklist: '1/en/N'})
CREATE (T13: Step {step: '13', step_id: '3.1.2', checklist: '1/en/N'})

CREATE (T14: Step {step: '14', step_id: '4.1.1', checklist: '1/en/N'})
CREATE (T15: Step {step: '15', step_id: '4.1.2', checklist: '1/en/N'})
CREATE (T16: Step {step: '16', step_id: '4.1.3', checklist: '1/en/N'})
CREATE (T17: Step {step: '17', step_id: '4.1.4', checklist: '1/en/N'})

CREATE (T18: Step {step: '18', step_id: '5.1.1', checklist: '1/en/N'})
CREATE (T19: Step {step: '19', step_id: '5.1.2', checklist: '1/en/N'})
CREATE (T20: Step {step: '20', step_id: '5.1.3', checklist: '1/en/N'})
CREATE (T21: Step {step: '21', step_id: '5.1.4', checklist: '1/en/N'})
CREATE (T22: Step {step: '22', step_id: '5.1.5', checklist: '1/en/N'})
CREATE (T23: Step {step: '23', step_id: '5.1.6', checklist: '1/en/N'})
CREATE (T24: Step {step: '24', step_id: '5.1.7', checklist: '1/en/N'})
CREATE (T25: Step {step: '25', step_id: '5.1.8', checklist: '1/en/N'})
CREATE (T26: Step {step: '26', step_id: '5.1.9', checklist: '1/en/N'})
CREATE (T27: Step {step: '27', step_id: '5.1.10', checklist: '1/en/N'})
CREATE (T28: Step {step: '28', step_id: '5.1.11', checklist: '1/en/N'})
CREATE (T29: Step {step: '29', step_id: '5.1.12', checklist: '1/en/N'})

CREATE (T30: Step {step: '30', step_id: '6.1.1', checklist: '1/en/N'})
CREATE (T31: Step {step: '31', step_id: '6.1.2', checklist: '1/en/N'})

CREATE (T32: Step {step: '32', step_id: '6.2.1', checklist: '1/en/N'})
CREATE (T33: Step {step: '33', step_id: '6.2.2', checklist: '1/en/N'})

CREATE (T34: Step {step: '34', step_id: '6.3.1', checklist: '1/en/N'})
CREATE (T35: Step {step: '35', step_id: '6.3.2', checklist: '1/en/N'})
CREATE (T36: Step {step: '36', step_id: '6.3.3', checklist: '1/en/N'})

CREATE (T37: Step {step: '37', step_id: '7.1.1', checklist: '1/en/N'})
CREATE (T38: Step {step: '38', step_id: '7.1.2', checklist: '1/en/N'})

CREATE (T39: Step {step: '39', step_id: '7.2.1', checklist: '1/en/N'})
CREATE (T40: Step {step: '40', step_id: '7.2.2', checklist: '1/en/N'})

CREATE (T41: Step {step: '41', step_id: '7.3.1', checklist: '1/en/N'})
CREATE (T42: Step {step: '42', step_id: '7.3.2', checklist: '1/en/N'})

CREATE (T43: Step {step: '43', step_id: '7.4.1', checklist: '1/en/N'})
CREATE (T44: Step {step: '44', step_id: '7.4.2', checklist: '1/en/N'})
CREATE (T45: Step {step: '45', step_id: '7.4.3', checklist: '1/en/N'})
CREATE (T46: Step {step: '46', step_id: '7.4.4', checklist: '1/en/N'})
CREATE (T47: Step {step: '47', step_id: '7.4.5', checklist: '1/en/N'})
CREATE (T48: Step {step: '48', step_id: '7.4.6', checklist: '1/en/N'})

CREATE (T49: Step {step: '49', step_id: '7.5.1', checklist: '1/en/N'})
CREATE (T50: Step {step: '50', step_id: '7.5.2', checklist: '1/en/N'})

CREATE (T51: Step {step: '51', step_id: '8.1.1', checklist: '1/en/N'})
CREATE (T52: Step {step: '52', step_id: '8.1.2', checklist: '1/en/N'})

CREATE (T53: Step {step: '53', step_id: '8.2.1', checklist: '1/en/N'})
CREATE (T54: Step {step: '54', step_id: '8.2.2', checklist: '1/en/N'})

CREATE (T55: Step {step: '55', step_id: '8.3.1', checklist: '1/en/N'})
CREATE (T56: Step {step: '56', step_id: '8.3.2', checklist: '1/en/N'})

CREATE (T57: Step {step: '57', step_id: '8.4.1', checklist: '1/en/N'})
CREATE (T58: Step {step: '58', step_id: '8.4.2', checklist: '1/en/N'})
CREATE (T59: Step {step: '59', step_id: '8.4.3', checklist: '1/en/N'})
CREATE (T60: Step {step: '60', step_id: '8.4.4', checklist: '1/en/N'})
CREATE (T61: Step {step: '61', step_id: '8.4.5', checklist: '1/en/N'})
CREATE (T62: Step {step: '62', step_id: '8.4.6', checklist: '1/en/N'})

CREATE (T63: Step {step: '63', step_id: '8.5.1', checklist: '1/en/N'})
CREATE (T64: Step {step: '64', step_id: '8.5.2', checklist: '1/en/N'})

CREATE (T65: Step {step: '65', step_id: '8.6.1', checklist: '1/en/N'})
CREATE (T66: Step {step: '66', step_id: '8.6.2', checklist: '1/en/N'})
CREATE (T67: Step {step: '67', step_id: '8.6.3', checklist: '1/en/N'})

CREATE (T68: Step {step: '68', step_id: '8.7.1', checklist: '1/en/N'})
CREATE (T69: Step {step: '69', step_id: '8.7.2', checklist: '1/en/N'})
CREATE (T70: Step {step: '70', step_id: '8.7.3', checklist: '1/en/N'})
CREATE (T71: Step {step: '71', step_id: '8.7.4', checklist: '1/en/N'})
CREATE (T72: Step {step: '72', step_id: '8.7.5', checklist: '1/en/N'})
CREATE (T73: Step {step: '73', step_id: '8.7.6', checklist: '1/en/N'})
CREATE (T74: Step {step: '74', step_id: '8.7.7', checklist: '1/en/N'})

CREATE (T75: Step {step: '75', step_id: '8.8.1', checklist: '1/en/N'})
CREATE (T76: Step {step: '76', step_id: '8.8.2', checklist: '1/en/N'})

CREATE (T77: Step {step: '77', step_id: '9.1.1', checklist: '1/en/N'})
CREATE (T78: Step {step: '78', step_id: '9.1.2', checklist: '1/en/N'})
CREATE (T79: Step {step: '79', step_id: '9.1.3', checklist: '1/en/N'})
CREATE (T80: Step {step: '80', step_id: '9.1.4', checklist: '1/en/N'})
CREATE (T81: Step {step: '81', step_id: '9.1.5', checklist: '1/en/N'})
CREATE (T82: Step {step: '82', step_id: '9.1.6', checklist: '1/en/N'})

CREATE (T83: Step {step: '83', step_id: '10.1.1', checklist: '1/en/N'})
CREATE (T84: Step {step: '84', step_id: '10.1.2', checklist: '1/en/N'})

CREATE (T85: Step {step: '85', step_id: '11.1.1', checklist: '1/en/N'})
CREATE (T86: Step {step: '86', step_id: '11.1.2', checklist: '1/en/N'})

CREATE (T87: Step {step: '87', step_id: '12.1.1', checklist: '1/en/N'})

CREATE (T88: Step {step: '88', step_id: '13.1.1', checklist: '1/en/N'})
CREATE (T89: Step {step: '89', step_id: '13.1.2', checklist: '1/en/N'})

// empty step (empty placeholder)
CREATE (T90: Step {step: '90', step_id: '14.1.1', checklist: '1/en/N'}),

//......................step relationships ............................
(T1)-[:HAS_NEXT_STEP] -> (T2), (T2)-[:HAS_PREVIOUS_STEP] -> (T1),
(T2)-[:HAS_NEXT_STEP] -> (T3), (T3)-[:HAS_PREVIOUS_STEP] -> (T2),
(T3)-[:HAS_NEXT_STEP] -> (T4), (T4)-[:HAS_PREVIOUS_STEP] -> (T3),
(T4)-[:HAS_NEXT_STEP] -> (T5), (T5)-[:HAS_PREVIOUS_STEP] -> (T4),
(T5)-[:HAS_NEXT_STEP] -> (T6), (T6)-[:HAS_PREVIOUS_STEP] -> (T5),
(T6)-[:HAS_NEXT_STEP] -> (T7), (T7)-[:HAS_PREVIOUS_STEP] -> (T6),
(T7)-[:HAS_NEXT_STEP] -> (T8), (T8)-[:HAS_PREVIOUS_STEP] -> (T7),
(T8)-[:HAS_NEXT_STEP] -> (T9), (T9)-[:HAS_PREVIOUS_STEP] -> (T8),
(T9)-[:HAS_NEXT_STEP] -> (T10), (T10)-[:HAS_PREVIOUS_STEP] -> (T9),
(T10)-[:HAS_NEXT_STEP] -> (T11), (T11)-[:HAS_PREVIOUS_STEP] -> (T10),
(T11)-[:HAS_NEXT_STEP] -> (T12), (T12)-[:HAS_PREVIOUS_STEP] -> (T11),
(T12)-[:HAS_NEXT_STEP] -> (T13), (T13)-[:HAS_PREVIOUS_STEP] -> (T12),
(T13)-[:HAS_NEXT_STEP] -> (T14), (T14)-[:HAS_PREVIOUS_STEP] -> (T13),
(T14)-[:HAS_NEXT_STEP] -> (T15), (T15)-[:HAS_PREVIOUS_STEP] -> (T14),
(T15)-[:HAS_NEXT_STEP] -> (T16), (T16)-[:HAS_PREVIOUS_STEP] -> (T15),
(T16)-[:HAS_NEXT_STEP] -> (T17), (T17)-[:HAS_PREVIOUS_STEP] -> (T16),
(T17)-[:HAS_NEXT_STEP] -> (T18), (T18)-[:HAS_PREVIOUS_STEP] -> (T17),
(T18)-[:HAS_NEXT_STEP] -> (T19), (T19)-[:HAS_PREVIOUS_STEP] -> (T18),
(T19)-[:HAS_NEXT_STEP] -> (T20), (T20)-[:HAS_PREVIOUS_STEP] -> (T19),
(T20)-[:HAS_NEXT_STEP] -> (T21), (T21)-[:HAS_PREVIOUS_STEP] -> (T20),
(T21)-[:HAS_NEXT_STEP] -> (T22), (T22)-[:HAS_PREVIOUS_STEP] -> (T21),
(T22)-[:HAS_NEXT_STEP] -> (T23), (T23)-[:HAS_PREVIOUS_STEP] -> (T22),
(T23)-[:HAS_NEXT_STEP] -> (T24), (T24)-[:HAS_PREVIOUS_STEP] -> (T23),
(T24)-[:HAS_NEXT_STEP] -> (T25), (T25)-[:HAS_PREVIOUS_STEP] -> (T24),
(T25)-[:HAS_NEXT_STEP] -> (T26), (T26)-[:HAS_PREVIOUS_STEP] -> (T25),
(T26)-[:HAS_NEXT_STEP] -> (T27), (T27)-[:HAS_PREVIOUS_STEP] -> (T26),
(T27)-[:HAS_NEXT_STEP] -> (T28), (T28)-[:HAS_PREVIOUS_STEP] -> (T27),
(T28)-[:HAS_NEXT_STEP] -> (T29), (T29)-[:HAS_PREVIOUS_STEP] -> (T28),
(T29)-[:HAS_NEXT_STEP] -> (T30), (T30)-[:HAS_PREVIOUS_STEP] -> (T29),
(T30)-[:HAS_NEXT_STEP] -> (T31), (T31)-[:HAS_PREVIOUS_STEP] -> (T30),
(T31)-[:HAS_NEXT_STEP] -> (T32), (T32)-[:HAS_PREVIOUS_STEP] -> (T31),
(T32)-[:HAS_NEXT_STEP] -> (T33), (T33)-[:HAS_PREVIOUS_STEP] -> (T32),
(T33)-[:HAS_NEXT_STEP] -> (T34), (T34)-[:HAS_PREVIOUS_STEP] -> (T33),
(T34)-[:HAS_NEXT_STEP] -> (T35), (T35)-[:HAS_PREVIOUS_STEP] -> (T34),
(T35)-[:HAS_NEXT_STEP] -> (T36), (T36)-[:HAS_PREVIOUS_STEP] -> (T35),
(T36)-[:HAS_NEXT_STEP] -> (T37), (T37)-[:HAS_PREVIOUS_STEP] -> (T36),
(T37)-[:HAS_NEXT_STEP] -> (T38), (T38)-[:HAS_PREVIOUS_STEP] -> (T37),
(T38)-[:HAS_NEXT_STEP] -> (T39), (T39)-[:HAS_PREVIOUS_STEP] -> (T38),
(T39)-[:HAS_NEXT_STEP] -> (T40), (T40)-[:HAS_PREVIOUS_STEP] -> (T39),
(T40)-[:HAS_NEXT_STEP] -> (T41), (T41)-[:HAS_PREVIOUS_STEP] -> (T40),
(T41)-[:HAS_NEXT_STEP] -> (T42), (T42)-[:HAS_PREVIOUS_STEP] -> (T41),
(T42)-[:HAS_NEXT_STEP] -> (T43), (T43)-[:HAS_PREVIOUS_STEP] -> (T42),
(T43)-[:HAS_NEXT_STEP] -> (T44), (T44)-[:HAS_PREVIOUS_STEP] -> (T43),
(T44)-[:HAS_NEXT_STEP] -> (T45), (T45)-[:HAS_PREVIOUS_STEP] -> (T44),
(T45)-[:HAS_NEXT_STEP] -> (T46), (T46)-[:HAS_PREVIOUS_STEP] -> (T45),
(T46)-[:HAS_NEXT_STEP] -> (T47), (T47)-[:HAS_PREVIOUS_STEP] -> (T46),
(T47)-[:HAS_NEXT_STEP] -> (T48), (T48)-[:HAS_PREVIOUS_STEP] -> (T47),
(T48)-[:HAS_NEXT_STEP] -> (T49), (T49)-[:HAS_PREVIOUS_STEP] -> (T48),
(T49)-[:HAS_NEXT_STEP] -> (T50), (T50)-[:HAS_PREVIOUS_STEP] -> (T49),
(T50)-[:HAS_NEXT_STEP] -> (T51), (T51)-[:HAS_PREVIOUS_STEP] -> (T50),
(T51)-[:HAS_NEXT_STEP] -> (T52), (T52)-[:HAS_PREVIOUS_STEP] -> (T51),
(T52)-[:HAS_NEXT_STEP] -> (T53), (T53)-[:HAS_PREVIOUS_STEP] -> (T52),
(T53)-[:HAS_NEXT_STEP] -> (T54), (T54)-[:HAS_PREVIOUS_STEP] -> (T53),
(T54)-[:HAS_NEXT_STEP] -> (T55), (T55)-[:HAS_PREVIOUS_STEP] -> (T54),
(T55)-[:HAS_NEXT_STEP] -> (T56), (T56)-[:HAS_PREVIOUS_STEP] -> (T55),
(T56)-[:HAS_NEXT_STEP] -> (T57), (T57)-[:HAS_PREVIOUS_STEP] -> (T56),
(T57)-[:HAS_NEXT_STEP] -> (T58), (T58)-[:HAS_PREVIOUS_STEP] -> (T57),
(T58)-[:HAS_NEXT_STEP] -> (T59), (T59)-[:HAS_PREVIOUS_STEP] -> (T58),
(T59)-[:HAS_NEXT_STEP] -> (T60), (T60)-[:HAS_PREVIOUS_STEP] -> (T59),
(T60)-[:HAS_NEXT_STEP] -> (T61), (T61)-[:HAS_PREVIOUS_STEP] -> (T60),
(T61)-[:HAS_NEXT_STEP] -> (T62), (T62)-[:HAS_PREVIOUS_STEP] -> (T61),
(T62)-[:HAS_NEXT_STEP] -> (T63), (T63)-[:HAS_PREVIOUS_STEP] -> (T62),
(T63)-[:HAS_NEXT_STEP] -> (T64), (T64)-[:HAS_PREVIOUS_STEP] -> (T63),
(T64)-[:HAS_NEXT_STEP] -> (T65), (T65)-[:HAS_PREVIOUS_STEP] -> (T64),
(T65)-[:HAS_NEXT_STEP] -> (T66), (T66)-[:HAS_PREVIOUS_STEP] -> (T65),
(T66)-[:HAS_NEXT_STEP] -> (T67), (T67)-[:HAS_PREVIOUS_STEP] -> (T66),
(T67)-[:HAS_NEXT_STEP] -> (T68), (T68)-[:HAS_PREVIOUS_STEP] -> (T67),
(T68)-[:HAS_NEXT_STEP] -> (T69), (T69)-[:HAS_PREVIOUS_STEP] -> (T68),
(T69)-[:HAS_NEXT_STEP] -> (T70), (T70)-[:HAS_PREVIOUS_STEP] -> (T69),
(T70)-[:HAS_NEXT_STEP] -> (T71), (T71)-[:HAS_PREVIOUS_STEP] -> (T70),
(T71)-[:HAS_NEXT_STEP] -> (T72), (T72)-[:HAS_PREVIOUS_STEP] -> (T71),
(T72)-[:HAS_NEXT_STEP] -> (T73), (T73)-[:HAS_PREVIOUS_STEP] -> (T72),
(T73)-[:HAS_NEXT_STEP] -> (T74), (T74)-[:HAS_PREVIOUS_STEP] -> (T73),
(T74)-[:HAS_NEXT_STEP] -> (T75), (T75)-[:HAS_PREVIOUS_STEP] -> (T74),
(T75)-[:HAS_NEXT_STEP] -> (T76), (T76)-[:HAS_PREVIOUS_STEP] -> (T75),
(T76)-[:HAS_NEXT_STEP] -> (T77), (T77)-[:HAS_PREVIOUS_STEP] -> (T76),
(T77)-[:HAS_NEXT_STEP] -> (T78), (T78)-[:HAS_PREVIOUS_STEP] -> (T77),
(T78)-[:HAS_NEXT_STEP] -> (T79), (T79)-[:HAS_PREVIOUS_STEP] -> (T78),
(T79)-[:HAS_NEXT_STEP] -> (T80), (T80)-[:HAS_PREVIOUS_STEP] -> (T79),
(T80)-[:HAS_NEXT_STEP] -> (T81), (T81)-[:HAS_PREVIOUS_STEP] -> (T80),
(T81)-[:HAS_NEXT_STEP] -> (T82), (T82)-[:HAS_PREVIOUS_STEP] -> (T81),
(T82)-[:HAS_NEXT_STEP] -> (T83), (T83)-[:HAS_PREVIOUS_STEP] -> (T82),
(T83)-[:HAS_NEXT_STEP] -> (T84), (T84)-[:HAS_PREVIOUS_STEP] -> (T83),
(T84)-[:HAS_NEXT_STEP] -> (T85), (T85)-[:HAS_PREVIOUS_STEP] -> (T84),
(T85)-[:HAS_NEXT_STEP] -> (T86), (T86)-[:HAS_PREVIOUS_STEP] -> (T85),
(T86)-[:HAS_NEXT_STEP] -> (T87), (T87)-[:HAS_PREVIOUS_STEP] -> (T86),
(T87)-[:HAS_NEXT_STEP] -> (T88), (T88)-[:HAS_PREVIOUS_STEP] -> (T87),
(T88)-[:HAS_NEXT_STEP] -> (T89), (T89)-[:HAS_PREVIOUS_STEP] -> (T88),
(T89)-[:HAS_NEXT_STEP] -> (T90), (T90)-[:HAS_PREVIOUS_STEP] -> (T89),
(T90)-[:HAS_NEXT_STEP] -> (T1),

//..............Expertise and checklist relationships.........................................
(E)-[:SHOULD_PERFORM] -> (L1),

(L1)-[:CONTAINS] -> (T1), (L1)-[:CONTAINS] -> (T2), (L1)-[:CONTAINS] -> (T3),
(L1)-[:CONTAINS] -> (T4), (L1)-[:CONTAINS] -> (T5), (L1)-[:CONTAINS] -> (T6),
(L1)-[:CONTAINS] -> (T7), (L1)-[:CONTAINS] -> (T8), (L1)-[:CONTAINS] -> (T9),
(L1)-[:CONTAINS] -> (T10), (L1)-[:CONTAINS] -> (T11), (L1)-[:CONTAINS] -> (T12),
(L1)-[:CONTAINS] -> (T13), (L1)-[:CONTAINS] -> (T14), (L1)-[:CONTAINS] -> (T15),
(L1)-[:CONTAINS] -> (T16), (L1)-[:CONTAINS] -> (T17), (L1)-[:CONTAINS] -> (T18),
(L1)-[:CONTAINS] -> (T19), (L1)-[:CONTAINS] -> (T20), (L1)-[:CONTAINS] -> (T21),
(L1)-[:CONTAINS] -> (T22), (L1)-[:CONTAINS] -> (T23), (L1)-[:CONTAINS] -> (T24),
(L1)-[:CONTAINS] -> (T25), (L1)-[:CONTAINS] -> (T26), (L1)-[:CONTAINS] -> (T27),
(L1)-[:CONTAINS] -> (T28), (L1)-[:CONTAINS] -> (T29), (L1)-[:CONTAINS] -> (T30),
(L1)-[:CONTAINS] -> (T31), (L1)-[:CONTAINS] -> (T32), (L1)-[:CONTAINS] -> (T33),
(L1)-[:CONTAINS] -> (T34), (L1)-[:CONTAINS] -> (T35), (L1)-[:CONTAINS] -> (T36),
(L1)-[:CONTAINS] -> (T37), (L1)-[:CONTAINS] -> (T38), (L1)-[:CONTAINS] -> (T39),
(L1)-[:CONTAINS] -> (T40), (L1)-[:CONTAINS] -> (T41), (L1)-[:CONTAINS] -> (T42),
(L1)-[:CONTAINS] -> (T43), (L1)-[:CONTAINS] -> (T44), (L1)-[:CONTAINS] -> (T45),
(L1)-[:CONTAINS] -> (T46), (L1)-[:CONTAINS] -> (T47), (L1)-[:CONTAINS] -> (T48),
(L1)-[:CONTAINS] -> (T49), (L1)-[:CONTAINS] -> (T50), (L1)-[:CONTAINS] -> (T51),
(L1)-[:CONTAINS] -> (T52), (L1)-[:CONTAINS] -> (T53), (L1)-[:CONTAINS] -> (T54),
(L1)-[:CONTAINS] -> (T55), (L1)-[:CONTAINS] -> (T56), (L1)-[:CONTAINS] -> (T57),
(L1)-[:CONTAINS] -> (T58), (L1)-[:CONTAINS] -> (T59), (L1)-[:CONTAINS] -> (T60),
(L1)-[:CONTAINS] -> (T61), (L1)-[:CONTAINS] -> (T62), (L1)-[:CONTAINS] -> (T63),
(L1)-[:CONTAINS] -> (T64), (L1)-[:CONTAINS] -> (T65), (L1)-[:CONTAINS] -> (T66),
(L1)-[:CONTAINS] -> (T67), (L1)-[:CONTAINS] -> (T68), (L1)-[:CONTAINS] -> (T69),
(L1)-[:CONTAINS] -> (T70), (L1)-[:CONTAINS] -> (T71), (L1)-[:CONTAINS] -> (T72),
(L1)-[:CONTAINS] -> (T73), (L1)-[:CONTAINS] -> (T74), (L1)-[:CONTAINS] -> (T75),
(L1)-[:CONTAINS] -> (T76), (L1)-[:CONTAINS] -> (T77), (L1)-[:CONTAINS] -> (T78),
(L1)-[:CONTAINS] -> (T79), (L1)-[:CONTAINS] -> (T80), (L1)-[:CONTAINS] -> (T81),
(L1)-[:CONTAINS] -> (T82), (L1)-[:CONTAINS] -> (T83), (L1)-[:CONTAINS] -> (T84),
(L1)-[:CONTAINS] -> (T85), (L1)-[:CONTAINS] -> (T86), (L1)-[:CONTAINS] -> (T87),
(L1)-[:CONTAINS] -> (T88), (L1)-[:CONTAINS] -> (T89), (L1)-[:CONTAINS] -> (T90);


// ............................Step- 1.1.1................
MERGE (T: Step {step: '1', step_id: '1.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Labels not readable'
    })
MERGE (O: Object {
    objective: 'Readbility of all barcodes present on packaging label'
    })
MERGE (A: Action {
    action: 'Use scanner to detect readbility'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '1', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '1', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '1', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.1.2................
MERGE (T: Step {step: '2', step_id: '1.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Wrong labels data'
    })
MERGE (O: Object {
    objective: 'Right correspindance of label and products'
    })
MERGE (A: Action {
    action: 'Verify the matching with specific database'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '2', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '2', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '2', checklist: '1/en/N'}] -> (D);

// ............................Step- 1.1.3................
MERGE (T: Step {step: '3', step_id: '1.1.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Wrong labels data'
    })
MERGE (O: Object {
    objective: 'Same data (Serial number, 12nc EAN code) on all the different labels'
    })
MERGE (A: Action {
    action: 'Inspect visually, use info systems'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '3', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '3', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '3', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.2.1................
MERGE (T: Step {step: '4', step_id: '1.2.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Bad printing quality'
    })
MERGE (O: Object {
    objective: 'Clear printing'
    })
MERGE (A: Action {
    action: 'Check visually all the labels'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '4', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '4', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '4', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.2.2................
MERGE (T: Step {step: '5', step_id: '1.2.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Partial printing'
    })
MERGE (O: Object {
    objective: 'Complete printing'
    })
MERGE (A: Action {
    action: 'Check visually all the labels'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '5', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '5', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '5', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.2.3................
MERGE (T: Step {step: '6', step_id: '1.2.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Dirty, stain, smudges'
    })
MERGE (O: Object {
    objective: 'Clean labels'
    })
MERGE (A: Action {
    action: 'Check visually all the labels'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '6', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '6', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '6', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.2.4................
MERGE (T: Step {step: '7', step_id: '1.2.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Damages, breakages,'
    })
MERGE (O: Object {
    objective: 'Not damaged labels'
    })
MERGE (A: Action {
    action: 'Check visually all the labels'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '7', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '7', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '7', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.3.1................
MERGE (T: Step {step: '8', step_id: '1.3.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Error in bill of material'
    })
MERGE (O: Object {
    objective: 'Right corrispodence of the document'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '8', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '8', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '8', checklist: '1/en/N'}] -> (D);


// ............................Step- 1.3.2................
MERGE (T: Step {step: '9', step_id: '1.3.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Instruction for Use with focus on labels'
    })
MERGE (D: Defect {
    defect: 'Incomplete Instruction for Use'
    })
MERGE (O: Object {
    objective: 'Instruction for Use completeness'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '9', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '9', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '9', checklist: '1/en/N'}] -> (D);


// ............................Step- 2.1.1................
MERGE (T: Step {step: '10', step_id: '2.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Installation KIT'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material'
    })
MERGE (O: Object {
    objective: 'Right corrispodence of the KIT'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '10', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '10', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '10', checklist: '1/en/N'}] -> (D);


// ............................Step- 2.1.2................
MERGE (T: Step {step: '11', step_id: '2.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Installation KIT'
    })
MERGE (D: Defect {
    defect: 'Incomplete KIT'
    })
MERGE (O: Object {
    objective: 'KIT completeness'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '11', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '11', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '11', checklist: '1/en/N'}] -> (D);


// ............................Step- 3.1.1................
MERGE (T: Step {step: '12', step_id: '3.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Packaging'
    })
MERGE (D: Defect {
    defect: 'Wrong symbols'
    })
MERGE (O: Object {
    objective: 'Right Symbols on packaging'
    })
MERGE (A: Action {
    action: 'Match pakaging symbols according to packaging label (transportations and recycling)'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '12', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '12', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '12', checklist: '1/en/N'}] -> (D);


// ............................Step- 3.1.2................
MERGE (T: Step {step: '13', step_id: '3.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Packaging'
    })
MERGE (D: Defect {
    defect: 'Broken package'
    })
MERGE (O: Object {
    objective: 'Integrity of components'
    })
MERGE (A: Action {
    action: 'Inspect visually all packagig parts'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '13', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '13', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '13', checklist: '1/en/N'}] -> (D);


// ............................Step- 4.1.1................
MERGE (T: Step {step: '14', step_id: '4.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Test mode'
    })
MERGE (D: Defect {
    defect: 'Door opening issue'
    })
MERGE (O: Object {
    objective: 'Door opening has to work'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '14', what: 'open', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '14', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '14', checklist: '1/en/N'}] -> (D);


// ............................Step- 4.1.2................
MERGE (T: Step {step: '15', step_id: '4.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Test mode'
    })
MERGE (D: Defect {
    defect: 'Unreadble product label'
    })
MERGE (O: Object {
    objective: 'Curret and voltage requirements on product label'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '15', what: 'check', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '15', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '15', checklist: '1/en/N'}] -> (D);


// ............................Step- 4.1.3................
MERGE (T: Step {step: '16', step_id: '4.1.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Test mode'
    })
MERGE (D: Defect {
    defect: 'No electric energy activation'
    })
MERGE (O: Object {
    objective: 'Product activates with electric power'
    })
MERGE (A: Action {
    action: 'Connect elecric plug with right electric power'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '16', what: 'connect', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '16', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '16', checklist: '1/en/N'}] -> (D);


// ............................Step- 4.1.4................
MERGE (T: Step {step: '17', step_id: '4.1.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Test mode'
    })
MERGE (D: Defect {
    defect: 'Test mode failure'
    })
MERGE (O: Object {
    objective: 'Test mode inspection successful'
    })
MERGE (A: Action {
    action: 'Close door and push start button'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '17', what: 'start', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '17', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '17', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.1................
MERGE (T: Step {step: '18', step_id: '5.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Electrical part broken or not connected'
    })
MERGE (O: Object {
    objective: 'Power used in different functions'
    })
MERGE (A: Action {
    action: 'Use wattmeter if the power change'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '18', what: 'measure', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '18', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '18', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.2................
MERGE (T: Step {step: '19', step_id: '5.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Glass plate broken or not turn'
    })
MERGE (O: Object {
    objective: 'Plate rotation has to work'
    })
MERGE (A: Action {
    action: 'Inspect visually during product function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '19', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '19', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '19', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.3................
MERGE (T: Step {step: '20', step_id: '5.1.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Misoperating light'
    })
MERGE (O: Object {
    objective: 'Internal light have to work'
    })
MERGE (A: Action {
    action: 'Inspect visually during product function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '20', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '20', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '20', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.4................
MERGE (T: Step {step: '21', step_id: '5.1.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Wrong setting of the board'
    })
MERGE (O: Object {
    objective: 'Timer have to work'
    })
MERGE (A: Action {
    action: 'Set timer and verify his function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '21', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '21', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '21', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.5................
MERGE (T: Step {step: '22', step_id: '5.1.5', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Performance of product are not ok'
    })
MERGE (O: Object {
    objective: 'MWO mw generation'
    })
MERGE (A: Action {
    action: 'Use becker with water inside'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '22', what: 'control', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '22', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '22', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.6................
MERGE (T: Step {step: '23', step_id: '5.1.6', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Broken component or not connected'
    })
MERGE (O: Object {
    objective: 'Cavity fan and cooling fan have to work'
    })
MERGE (A: Action {
    action: 'Inspect visually during product function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '23', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '23', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '23', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.7................
MERGE (T: Step {step: '24', step_id: '5.1.7', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Bad assembly of internal components'
    })
MERGE (O: Object {
    objective: 'No abnormal noise have to be present during product function'
    })
MERGE (A: Action {
    action: 'Hear the product during function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '24', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '24', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '24', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.8................
MERGE (T: Step {step: '25', step_id: '5.1.8', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Bad assembly of internal components, component not connected, component broken'
    })
MERGE (O: Object {
    objective: 'Door switch have to engage in order to allow product function'
    })
MERGE (A: Action {
    action: 'Verify if the product work'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '25', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '25', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '25', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.9................
MERGE (T: Step {step: '26', step_id: '5.1.9', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Bad assembly of internal components, component not connected, component broken'
    })
MERGE (O: Object {
    objective: 'Pushbutton or thouch have to work'
    })
MERGE (A: Action {
    action: 'Press buttons or touch screen and verify the reactions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '26', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '26', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '26', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.10................
MERGE (T: Step {step: '27', step_id: '5.1.10', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Bad assembly of internal components, component not connected, component broken'
    })
MERGE (O: Object {
    objective: 'Knob has to work'
    })
MERGE (A: Action {
    action: 'Turn knob in different position and verify the reactions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '27', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '27', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '27', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.11................
MERGE (T: Step {step: '28', step_id: '5.1.11', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Bad assembly of internal components, component not connected, component broken'
    })
MERGE (O: Object {
    objective: 'Meat probe has to work'
    })
MERGE (A: Action {
    action: 'Use meat probe and set the right function to verify temperature reaction'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '28', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '28', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '28', checklist: '1/en/N'}] -> (D);


// ............................Step- 5.1.12................
MERGE (T: Step {step: '29', step_id: '5.1.12', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Usability'
    })
MERGE (D: Defect {
    defect: 'Bad assembly of internal components, component not connected, component broken'
    })
MERGE (O: Object {
    objective: 'Steam function has to work'
    })
MERGE (A: Action {
    action: 'Set steam function and verify if it work'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '29', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '29', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '29', checklist: '1/en/N'}] -> (D);


// ............................Step- 6.1.1................
MERGE (T: Step {step: '30', step_id: '6.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'Becker with water no leakage'
    })
MERGE (A: Action {
    action: 'Put filled becker in the cavity (275 mml)'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '30', what: 'prepare', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '30', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '30', checklist: '1/en/N'}] -> (D);



// ............................Step- 6.1.2................
MERGE (T: Step {step: '31', step_id: '6.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'MWO function'
    })
MERGE (A: Action {
    action: 'Close door and push button (max 1 minute)'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '31', what: 'activate', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '31', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '31', checklist: '1/en/N'}] -> (D);


// ............................Step- 6.2.1................
MERGE (T: Step {step: '32', step_id: '6.2.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'Tester activates'
    })
MERGE (A: Action {
    action: 'Activate tester'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '32', what: 'prepare', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '32', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '32', checklist: '1/en/N'}] -> (D);


// ............................Step- 6.2.2................
MERGE (T: Step {step: '33', step_id: '6.2.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'No front leakeges'
    })
MERGE (A: Action {
    action: 'Move tester along defined path and check values lower than 5 mW/cm +/-2%'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '33', what: 'measure', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '33', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '33', checklist: '1/en/N'}] -> (D);

// ............................Step- 6.3.1................
MERGE (T: Step {step: '34', step_id: '6.3.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'Product back cover is disassembled'
    })
MERGE (A: Action {
    action: 'Disassebly mwo back cover to get access to the rear'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '34', what: 'open', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '34', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '34', checklist: '1/en/N'}] -> (D);


// ............................Step- 6.3.2................
MERGE (T: Step {step: '35', step_id: '6.3.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'Condensator has to discharge'
    })
MERGE (A: Action {
    action: 'Discharge the condesator with protected tool'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '35', what: 'secure', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '35', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '35', checklist: '1/en/N'}] -> (D);


// ............................Step- 6.3.3................
MERGE (T: Step {step: '36', step_id: '6.3.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'MW leak'
    })
MERGE (D: Defect {
    defect: 'MW leakege'
    })
MERGE (O: Object {
    objective: 'No front leakeges'
    })
MERGE (A: Action {
    action: 'Move tester along defined path and check values lower than 5 mW/cm +/-2%'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '36', what: 'measure', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '36', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '36', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.1.1................
MERGE (T: Step {step: '37', step_id: '7.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Visualization functions'
    })
MERGE (A: Action {
    action: 'Recall COALA function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '37', what: 'activate', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '37', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '37', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.1.2................
MERGE (T: Step {step: '38', step_id: '7.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Product matches the pictures'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '38', what: 'visualize', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '38', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '38', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.2.1................
MERGE (T: Step {step: '39', step_id: '7.2.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Scratch, dent, damages on the control panel'
    })
MERGE (O: Object {
    objective: 'No scratch, dent, damages on the control panel'
    })
MERGE (A: Action {
    action: 'Inspect visually control panel according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '39', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '39', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '39', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.2.2................
MERGE (T: Step {step: '40', step_id: '7.2.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Dirty, stain, smudges, color defects'
    })
MERGE (O: Object {
    objective: 'No dirty, stain, smudges, color defects on control panel'
    })
MERGE (A: Action {
    action: 'Inspect visually control panel according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '40', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '40', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '40', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.3.1................
MERGE (T: Step {step: '41', step_id: '7.3.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Smudges, fade, shadows, burrs'
    })
MERGE (O: Object {
    objective: 'No smudges, fade, shadows, burrs in the serigraphy of the control panel'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '41', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '41', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '41', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.3.2................
MERGE (T: Step {step: '42', step_id: '7.3.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Bad adhesion'
    })
MERGE (O: Object {
    objective: 'Serigrafy robustness'
    })
MERGE (A: Action {
    action: 'Test with adhesive tape'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '42', what: 'check', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '42', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '42', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.4.1................
MERGE (T: Step {step: '43', step_id: '7.4.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'All parts are present in the control panel (screws, fixing elements)'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '43', what: 'control', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '43', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '43', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.4.2................
MERGE (T: Step {step: '44', step_id: '7.4.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Bad assembly'
    })
MERGE (O: Object {
    objective: 'All parts are properly fixed and assembled'
    })
MERGE (A: Action {
    action: 'Try to pull control panel to test fixation on its base'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '44', what: 'control', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '44', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '44', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.4.3................
MERGE (T: Step {step: '45', step_id: '7.4.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Gaps, parts not correctly assembled, lack of glue'
    })
MERGE (O: Object {
    objective: 'No gaps between control panel, panel carrier, frame'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '45', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '45', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '45', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.4.4................
MERGE (T: Step {step: '46', step_id: '7.4.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Misalignement, bad assembly'
    })
MERGE (O: Object {
    objective: 'Control panel is aligned with door'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '46', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '46', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '46', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.4.5................
MERGE (T: Step {step: '47', step_id: '7.4.5', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Misalignement, bad assembly'
    })
MERGE (O: Object {
    objective: 'Display have to be alligned with control panel'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '47', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '47', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '47', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.4.6................
MERGE (T: Step {step: '48', step_id: '7.4.6', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Sharp edges, defective parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'No sharp edge on touchable parts'
    })
MERGE (A: Action {
    action: 'Check manually at the first level, use dedicated instrument in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '48', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '48', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '48', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.5.1................
MERGE (T: Step {step: '49', step_id: '7.5.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'components damage; mismatch of colour; serigraphy smudges; allignement of indicators on knob'
    })
MERGE (O: Object {
    objective: 'no estetical defects on control panel components( buttons; knobs; displays)'
    })
MERGE (A: Action {
    action: 'Inspect visually components according to aesthetical catalog definitions and product pictures'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '49', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '49', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '49', checklist: '1/en/N'}] -> (D);


// ............................Step- 7.5.2................
MERGE (T: Step {step: '50', step_id: '7.5.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Control panel'
    })
MERGE (D: Defect {
    defect: 'Broken components, color mismatch, stains, bas assembly'
    })
MERGE (O: Object {
    objective: 'Diplay LEDs are properly working for all the product functions'
    })
MERGE (A: Action {
    action: 'Inspect visually of display in different functions acting on knobs and buttons'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '50', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '50', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '50', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.1.1................
MERGE (T: Step {step: '51', step_id: '8.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Visualization functions'
    })
MERGE (A: Action {
    action: 'Recall COALA function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '51', what: 'activate', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '51', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '51', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.1.2................
MERGE (T: Step {step: '52', step_id: '8.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Product not in according with bill of material, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Door matches the product pictures'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '52', what: 'visualize', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '52', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '52', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.2.1................
MERGE (T: Step {step: '53', step_id: '8.2.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Scratch, dent, damages'
    })
MERGE (O: Object {
    objective: 'No scratch, dent, damages on the outer door'
    })
MERGE (A: Action {
    action: 'Inspect visually outer door according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '53', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '53', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '53', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.2.2................
MERGE (T: Step {step: '54', step_id: '8.2.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Dirty, stain, smudges, color defects'
    })
MERGE (O: Object {
    objective: 'No dirty, stain, smudges, color defects on the outer door'
    })
MERGE (A: Action {
    action: 'Inspect visually outer door according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '54', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '54', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '54', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.3.1................
MERGE (T: Step {step: '55', step_id: '8.3.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Smudges, fade, shadows, burrs'
    })
MERGE (O: Object {
    objective: 'No smudges, fade, shadows, burrs in the serigraphy of the door'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '55', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '55', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '55', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.3.2................
MERGE (T: Step {step: '56', step_id: '8.3.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad adhesion'
    })
MERGE (O: Object {
    objective: 'Serigrafy robustness'
    })
MERGE (A: Action {
    action: 'Test with adhesive tape'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '56', what: 'check', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '56', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '56', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.4.1................
MERGE (T: Step {step: '57', step_id: '8.4.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'All parts are present in the door (screws, fixing elements, hinges, handle)'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '57', what: 'control', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '57', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '57', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.4.2................
MERGE (T: Step {step: '58', step_id: '8.4.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly'
    })
MERGE (O: Object {
    objective: 'All parts are properly fixed and assembled'
    })
MERGE (A: Action {
    action: 'Try to pull handle to test fixation on the door'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '58', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '58', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '58', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.4.3................
MERGE (T: Step {step: '59', step_id: '8.4.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Misalignement, bad assembly'
    })
MERGE (O: Object {
    objective: 'Front alignement between control panel and door is complint to specifications'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '59', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '59', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '59', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.4.4................
MERGE (T: Step {step: '60', step_id: '8.4.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Misalignement, bad assembly'
    })
MERGE (O: Object {
    objective: 'Lateral alignement between control panel and door is complint to specifications'
    })
MERGE (A: Action {
    action: 'Inspect visually  according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '60', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '60', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '60', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.4.5................
MERGE (T: Step {step: '61', step_id: '8.4.5', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Misalignement, bad assembly'
    })
MERGE (O: Object {
    objective: 'Gap between control panel and door is compliant to specifications'
    })
MERGE (A: Action {
    action: 'Inspect visually  according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '61', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '61', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '61', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.4.6................
MERGE (T: Step {step: '62', step_id: '8.4.6', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Sharp edges, defective parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'No sharp edge on touchable parts'
    })
MERGE (A: Action {
    action: 'Check manually at the first level, use dedicated instrument in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '62', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '62', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '62', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.5.1................
MERGE (T: Step {step: '63', step_id: '8.5.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Components damage, color mismatch of colour, bad assembly'
    })
MERGE (O: Object {
    objective: 'No scratch, color mismatch, dirt, stain is present on the door handle'
    })
MERGE (A: Action {
    action: 'Inspect visually handle according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '63', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '63', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '63', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.5.2................
MERGE (T: Step {step: '64', step_id: '8.5.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bas assembly, missing parts'
    })
MERGE (O: Object {
    objective: 'Handle is properly fixed on its support'
    })
MERGE (A: Action {
    action: 'Try to pull and push manually the handle to test screws fixation'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '64', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '64', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '64', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.6.1................
MERGE (T: Step {step: '65', step_id: '8.6.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Door opening'
    })
MERGE (A: Action {
    action: 'Open the door and verify sound and forces'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '65', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '65', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '65', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.6.2................
MERGE (T: Step {step: '66', step_id: '8.6.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Hinges are well assembled and fixed'
    })
MERGE (A: Action {
    action: 'Test hinges movement and check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '66', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '66', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '66', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.6.3................
MERGE (T: Step {step: '67', step_id: '8.6.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Gasket damage, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'No aesthetical defects on gasket (no bubbles, no color mismatch, no dirt, no scratches)'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '67', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '67', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '67', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.1................
MERGE (T: Step {step: '68', step_id: '8.7.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Scratch, dent, dirty, enamel chipping, burns, missing parts, bas assembly'
    })
MERGE (O: Object {
    objective: 'No scratch, dent, or damages on the inner door'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '68', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '68', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '68', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.2................
MERGE (T: Step {step: '69', step_id: '8.7.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Dirty, stain, smudges, color defects'
    })
MERGE (O: Object {
    objective: 'No dirt, stain, smudges, color defects on the outer door'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '69', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '69', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '69', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.3................
MERGE (T: Step {step: '70', step_id: '8.7.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Defective parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'The protection grid has not holes and is is not damaged'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '70', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '70', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '70', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.4................
MERGE (T: Step {step: '71', step_id: '8.7.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Defective parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'No defects on silicon flow (right quantity, no bubbles, no deburring, no dirty)'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '71', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '71', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '71', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.5................
MERGE (T: Step {step: '72', step_id: '8.7.5', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, wrong parts'
    })
MERGE (O: Object {
    objective: 'Gaps between glass adn plastic innerdoor is less than 2mm'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '72', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '72', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '72', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.6................
MERGE (T: Step {step: '73', step_id: '8.7.6', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Foil damagend, bad adhesion, bad assembly'
    })
MERGE (O: Object {
    objective: 'No austethical defects on Foil (no bubbles, no detached areas)'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '73', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '73', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '73', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.7.7................
MERGE (T: Step {step: '74', step_id: '8.7.7', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Foil detachment, bad assembly'
    })
MERGE (O: Object {
    objective: 'Plastic foil has to resist to a pull force'
    })
MERGE (A: Action {
    action: 'Measure with dinamometer if no foil detachment till 6kg applied force'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '74', what: 'measure', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '74', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '74', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.8.1................
MERGE (T: Step {step: '75', step_id: '8.8.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, wrong parts'
    })
MERGE (O: Object {
    objective: 'Right part presence according to bill of material'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '75', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '75', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '75', checklist: '1/en/N'}] -> (D);


// ............................Step- 8.8.2................
MERGE (T: Step {step: '76', step_id: '8.8.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Door'
    })
MERGE (D: Defect {
    defect: 'Bad assembly, missing parts, wrong parts, damages'
    })
MERGE (O: Object {
    objective: 'Pull force for opening door lock is above correct'
    })
MERGE (A: Action {
    action: 'Use dinamometer to measure pull force 120n'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '76', what: 'measure', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '76', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '76', checklist: '1/en/N'}] -> (D);


// ............................Step- 9.1.1................
MERGE (T: Step {step: '77', step_id: '9.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, enammeling issues'
    })
MERGE (O: Object {
    objective: 'Internal cavity does not have aesthetical issues'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '77', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '77', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '77', checklist: '1/en/N'}] -> (D);


// ............................Step- 9.1.2................
MERGE (T: Step {step: '78', step_id: '9.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, enammeling issues'
    })
MERGE (O: Object {
    objective: 'Front cavity does not have aesthetical issues'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '78', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '78', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '78', checklist: '1/en/N'}] -> (D);


// ............................Step- 9.1.3................
MERGE (T: Step {step: '79', step_id: '9.1.3', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots, enammeling issues'
    })
MERGE (O: Object {
    objective: 'Lateral covers do not have aesthetical issues'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '79', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '79', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '79', checklist: '1/en/N'}] -> (D);


// ............................Step- 9.1.4................
MERGE (T: Step {step: '80', step_id: '9.1.4', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Missing parts, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'TT drive and TT ring are correct and in the right position'
    })
MERGE (A: Action {
    action: 'Inspect visually and check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '80', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '80', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '80', checklist: '1/en/N'}] -> (D);


// ............................Step- 9.1.5................
MERGE (T: Step {step: '81', step_id: '9.1.5', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Missing parts, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'Mica protection has to be present and correctly fixed'
    })
MERGE (A: Action {
    action: 'Inspect visually and check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '81', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '81', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '81', checklist: '1/en/N'}] -> (D);


// ............................Step- 9.1.6................
MERGE (T: Step {step: '82', step_id: '9.1.6', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Cavity'
    })
MERGE (D: Defect {
    defect: 'Missing parts, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'Probe has to be present fixed and in right position'
    })
MERGE (A: Action {
    action: 'Inspect visually and check corrispondence in COALA tablet in case of doubt'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '82', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '82', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '82', checklist: '1/en/N'}] -> (D);


// ............................Step- 10.1.1................
MERGE (T: Step {step: '83', step_id: '10.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'External covers'
    })
MERGE (D: Defect {
    defect: 'Scratch, dents, painting mismatch, dots'
    })
MERGE (O: Object {
    objective: 'External covers do not have aesthetical issues'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '83', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '83', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '83', checklist: '1/en/N'}] -> (D);


// ............................Step- 10.1.2................
MERGE (T: Step {step: '84', step_id: '10.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'External covers'
    })
MERGE (D: Defect {
    defect: 'Missig parts, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'All screws have to be present and properly fixed'
    })
MERGE (A: Action {
    action: 'Inspect visually'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '84', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '84', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '84', checklist: '1/en/N'}] -> (D);


// ............................Step- 11.1.1................
MERGE (T: Step {step: '85', step_id: '11.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Accessories'
    })
MERGE (D: Defect {
    defect: 'missing parts, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'Accesories in the cavity are compliant with bill of material'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet and verify accessories set completion and assembly'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '85', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '85', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '85', checklist: '1/en/N'}] -> (D);


// ............................Step- 11.1.2................
MERGE (T: Step {step: '86', step_id: '11.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Accessories'
    })
MERGE (D: Defect {
    defect: 'Broken parts, damages, dirty'
    })
MERGE (O: Object {
    objective: 'Accesories do not have aesthetical defect'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '86', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '86', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '86', checklist: '1/en/N'}] -> (D);


// ............................Step- 12.1.1................
MERGE (T: Step {step: '87', step_id: '12.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Noise'
    })
MERGE (D: Defect {
    defect: 'bad assembly, missing parts, defective parts'
    })
MERGE (O: Object {
    objective: 'Product noise is noise out of specifications'
    })
MERGE (A: Action {
    action: 'Hear the product during function'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '87', what: 'Control', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '87', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '87', checklist: '1/en/N'}] -> (D);


// ............................Step- 13.1.1................
MERGE (T: Step {step: '88', step_id: '13.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Plug'
    })
MERGE (D: Defect {
    defect: 'Missing parts, wrong parts, bad assembly'
    })
MERGE (O: Object {
    objective: 'Plug is compliant with bill of material'
    })
MERGE (A: Action {
    action: 'Check corrispondence in COALA tablet and verify plug type'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '88', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '88', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '88', checklist: '1/en/N'}] -> (D);


// ............................Step- 13.1.2................
MERGE (T: Step {step: '89', step_id: '13.1.2', checklist: '1/en/N'})

MERGE (C: Component {
    component: 'Plug'
    })
MERGE (D: Defect {
    defect: 'Broken parts, damages,  dirty'
    })
MERGE (O: Object {
    objective: 'Plug do not have aesthetical defect'
    })
MERGE (A: Action {
    action: 'Inspect visually according to aesthetical catalog definitions'
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '89', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '89', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '89', checklist: '1/en/N'}] -> (D);


// ............................Step- 14.1.1(empty placeholder)................
MERGE (T: Step {step: '90', step_id: '14.1.1', checklist: '1/en/N'})

MERGE (C: Component {
    component: ''
    })
MERGE (D: Defect {
    defect: ''
    })
MERGE (O: Object {
    objective: ''
    })
MERGE (A: Action {
    action: ''
    })
// definition of the relationships,
CREATE(T)-[:CONTAINS] -> (C),
(C)-[:VERB {step: '90', what: 'verify', checklist: '1/en/N'}] -> (O),
(O)-[:HOW {step: '90', checklist: '1/en/N'}] -> (A), (O)-[:NOT_FULFILLED {step: '90', checklist: '1/en/N'}] -> (D);
