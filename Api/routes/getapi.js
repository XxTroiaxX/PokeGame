const express = require("express");
const routes = express.Router();
const sql = require("../sql/sql");
const auth = require("../auth.js");

//apanhar pokedex
routes.get("/Pokedex", (req,res) => {
    sql.query("Select DISTINCT typepoke.IDTypePoke,typepoke.TypePoke,typepoke.TypeFoto From pokedex INNER JOIN typepoke On typepoke.IDTypePoke = pokedex.IDTypePoke", async (error,result) =>{
        if(error){
            throw error;
        }else{
            var array = []
            for(var i in result){
                var content = {
                    PokeType: result[i].TypePoke,
                    TypeFoto: result[i].TypeFoto,
                    Pokemons: await GetPokemons(result[i].IDTypePoke)
                }
                array.push(content)
            }
            res.json(array);
        }
    });
});

async function GetPokemons(id) {
    return new Promise(function(resolve, reject) {
        sql.query("Select DISTINCT pokedex.IDPokedex,pokedex.PokeName,pokedex.PokeVida,pokedex.PokeVida as VidaAtual,pokedex.PokeFoto,typepoke.TypePoke,pokenivel.Nivel,pokenivel.NivelXP From pokedex INNER JOIN pokenivel ON pokenivel.IDPokedex = pokedex.IDPokedex INNER JOIN typepoke ON typepoke.IDTypePoke = pokedex.IDTypePoke Where pokedex.IDTypePoke = ?",[id], async (error,result) => {
            if(error){
                throw error;
            }
            else{
                var array = []
                for(var i in result){
                    var content = {
                        PokemonData: [result[i]],
                        Atacks: await GetAtacks(result[i].IDPokedex)
                    }
                    array.push(content)
                }
                resolve(array);
            }
        });
    });
}

async function GetAtacks(id) {
    return new Promise(function(resolve, reject) {
        sql.query("Select Ataque,Dano From pokeatacks Where IDPokeDex = ?",[id], (error,result) => {
            if(error){
                throw error;
            }
            else{
              var send = []
              if(result == ""){
                for(var i = 0; i < 4; i++){
                  var json = {
                    Ataque: "",
                    Dano: "0"
                  };
                  send.push(json);
                }
                result = send;
              }
              resolve(result);
            }
        });
    });
}

//apanhar typePokes
routes.get("/GetTypePokes", auth.authenticateUser, (req,res) => {
    sql.query("Select TypePoke From typepoke", async (error,result) =>{
        if(error){
            throw error;
        }else{
            var array = []
            var content = {types:result}
            array.push(content)
            res.json(array);
        }
    });
});

//Apanhar todos os pokemons
routes.get("/AllPokemons", auth.authenticateUser, async (req,res) => {
  sql.query("Select DISTINCT pokedex.IDPokedex,pokedex.PokeName,pokedex.PokeVida,pokedex.PokeFoto,pokenivel.Nivel,pokenivel.NivelXP From pokedex INNER JOIN pokenivel ON pokenivel.IDPokedex = pokedex.IDPokedex", async (error,result) => {
      if(error){
          throw error;
      }
      else{
          var array = []
          for(var i in result){
              var content = {
                  PokemonData: [result[i]],
                  Atacks: await GetAtacks(result[i].IDPokedex)
              }
              array.push(content)
          }
          res.json(array)
      }
  });
})

//Apanhar o historicobatalhas
routes.get("/GetHistorico", auth.authenticateUser, (req,res) => {
  sql.query("Select historicobatalhas.IDPokedexInimigo,historicobatalhas.Estado,pokedex.PokeName,pokedex.PokeFoto From historicobatalhas INNER JOIN pokedex ON pokedex.IDPokedex = historicobatalhas.IDPokedexAmigo ORDER BY historicobatalhas.IDHistorico DESC", async (err, result) => {
    if(err){
      throw err
    }else{
      var array = []
      for(var i in result){
          var amigo = {
            PokeName: result[i].PokeName,
            PokeFoto: result[i].PokeFoto
          }
          var content = {
              Estado: result[i].Estado,
              Amigo: amigo,
              Inimigo: await GetHistoricoInimigo(result[i].IDPokedexInimigo)
          }
          array.push(content)
      }
      res.json(array);
    }
  })
})

async function GetHistoricoInimigo(id) {
    return new Promise(function(resolve, reject) {
        sql.query("SELECT pokedex.PokeName,pokedex.PokeFoto FROM pokemoninimigo INNER JOIN pokedex ON pokedex.IDPokedex = pokemoninimigo.IDPokedex WHERE pokemoninimigo.IDPokemonInimigo = ?",[id], (error,result) => {
            if(error){
                throw error;
            }
            else{
              var inimigo = {
                PokeName: result[0].PokeName,
                PokeFoto: result[0].PokeFoto
              }
              resolve(inimigo);
            }
        });
    });
}

module.exports = routes;
