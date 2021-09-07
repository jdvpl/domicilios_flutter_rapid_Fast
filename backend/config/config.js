const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e) => {}
}

const pgp = require('pg-promise')(options);
const types = pgp.pg.types;
types.setTypeParser(1114, function(stringValue) {
    return stringValue;
});




const databaseConfig = {
    'host': '34.95.159.189',
    'port': 5432,
    'database': 'postgres',
    'user': 'postgres',
    'password': 'Kakaroto95050*',
    'connectionLimit': 10,
    'connectTimeout': 30000

};

const db = pgp(databaseConfig);

module.exports = db;



//postgres:
//
//esowwrlnotqsep  //usuario
//82faec39a254e6826a7dacaa3c3542a6afe7edba6856f74d8981bfa083318aed // password
//@
//ec2-54-156-60-12.compute-1.amazonaws.com  //host
//:
//5432 //port
//d1jv9vvnaltliv /db


//postgres://
//sffesrtpoctpke
//:
//b940e3b2c2901e665ddc1955cd96b9a49a574c15a364ddae884f742be2597455
//@
//ec2-54-83-137-206.compute-1.amazonaws.com
//:
//5432
//d6t7b5ue5qs9p9