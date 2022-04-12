{
  "spriteId": {
    "name": "sprMumbaGun",
    "path": "sprites/sprMumbaGun/sprMumbaGun.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "mumbaWorldObject",
    "path": "objects/mumbaWorldObject/mumbaWorldObject.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":5,"value":"noone","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"owner","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"12","rangeEnabled":true,"rangeMin":0.0,"rangeMax":120.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"fireRate","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"fireTimer","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"mumbaBullet","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"bulletObject","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"6","rangeEnabled":true,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"bulletSpeed","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"2","rangeEnabled":true,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"inaccuracy","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"bulletNumber","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"1","rangeEnabled":true,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"bulletDamageMultiplier","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"sprMumbaGunUI","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"uiSprite","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":3,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"justFired","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"weight","path":"objects/mumbaWorldObject/mumbaWorldObject.yy",},"objectId":{"name":"mumbaWorldObject","path":"objects/mumbaWorldObject/mumbaWorldObject.yy",},"value":"0","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"canCollide","path":"objects/mumbaWorldObject/mumbaWorldObject.yy",},"objectId":{"name":"mumbaWorldObject","path":"objects/mumbaWorldObject/mumbaWorldObject.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"canMove","path":"objects/mumbaWorldObject/mumbaWorldObject.yy",},"objectId":{"name":"mumbaWorldObject","path":"objects/mumbaWorldObject/mumbaWorldObject.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "weapons",
    "path": "folders/Objects/mumba/in-game stuff/weapons.yy",
  },
  "resourceVersion": "1.0",
  "name": "mumbaGun",
  "tags": [],
  "resourceType": "GMObject",
}