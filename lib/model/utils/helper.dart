

import 'package:final_contact_assignment_map/model/people.dart';
import 'package:final_contact_assignment_map/model/utils/constraints.dart';

class Helper {
  static List<People> getAllHeroes() {
    List<People> heroList = heroes.values.toList();
    heroList.sort((a,b)=>b.id.compareTo(a.id));
    return heroList;
  }

  static People getHeroById(int id) {
   return heroes[id];
  }

  static bool createHero(People hero) {
    try{
      hero.id=getAllHeroes().first.id+1;
      heroes[hero.id] = hero;
      return true;
    }catch(error){
      return false;
    }
    /*try{
      hero.id =getAllHeroes().first.id+1;
      if(heroes.containsKey(hero.id)){
         return false;
      }else{
        heroes[hero.id]=hero;
      }
      return true;
    }catch(error){
      return false;
    }*/
  }

  static bool updateHero(People hero) {
    try{
      if(heroes.containsKey(hero.id)){
        heroes[hero.id] =hero;
        return true;
      }else{
        return false;
      }
    }
    catch(error){
      return false;
    }
  }

  static List<People> searchHero(String key) {
    return getAllHeroes().where((hero) =>
    //hero.name.toLowerCase().startsWith(key.toLowerCase()).toList();
        //heroes
           hero.name.toLowerCase().contains(key.toLowerCase())).toList();
        //         .toList();
    //|| hero.convertOrigin().toLowerCase()==key.toLowerCase()).toList();
  }

  static bool deleteHero(int id) {
    try{
     if(heroes.containsKey(id)){
       heroes.remove(id);
       return true;
     }else{
       return false;
     }
    }catch(error){
      return false;
    }
  }

  //favourite
  /*List<People> get episode{
    return getAllHeroes().where((People episode) => episode.isFavorite).toList(); //this will return a list where the isFavorite is true
  }*/

//
      static List<People> getFavoriteContact(){
        return getAllHeroes().where((hero) => hero.isFavorite).toList();
        //hero.name.toLowerCase().startsWith(key.toLowerCase()).toList();
        //heroes


      }
    /*newHero.id=getAllHeroes().first.id+1;
    newHero.name="${hero.name} - Duplicate";*/
    //return flag ? newHero:null;

}
