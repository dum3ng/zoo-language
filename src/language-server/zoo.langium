grammar Zoo

// zoo contains many room
// and a room conains some animal, a private room can only contain one animal


entry Model:
    (defs+=Def)*;
// (zoos+=Zoo | rooms+=Room | species+=Species | animals+=Animal)*;

Def:
    (Zoo | Room | Species | Animal);

Zoo:
    'zoo' name=ID;

Room:
    (private?='private')? 'room' name=ID ('in' zoo=[Zoo:ID])?  
    ('{' (residents+=ResidentInRoom)* '}')?;

ResidentInRoom:
    'res' resident=[Animal:ID];

Species:
    'species' name=ID age=INT;

Animal:
    'animal' name=ID 'of' species=[Species:ID];


hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal INT returns number: /[0-9]+/;
terminal STRING: /"(\\.|[^"\\])*"|'(\\.|[^'\\])*'/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
