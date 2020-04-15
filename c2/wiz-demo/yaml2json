#!/usr/bin/env node
const YAML = require('js-yaml')
const fs = require('fs')
const path = require('path')

const Y2J = 'yaml2json'
const J2Y = 'json2yaml'

let cmd = path.basename(process.argv[1])
if(cmd !== J2Y && cmd !== Y2J){
  console.log('bad command')
  process.exit(1)
}

let src = process.argv[2]
if(!src) {
  console.log(`usage:  ${cmd} <source-file>`)
  process.exit(1)
}

if(cmd === J2Y){
  let txt = fs.readFileSync(src,'utf8')
  let json = JSON.parse(txt)
  let yaml = YAML.safeDump(json)
  console.log(yaml)
}

if(cmd === Y2J){
  let txt = fs.readFileSync(src,'utf8')
  let json = YAML.safeLoad(txt)
  console.log(JSON.stringify(json,null,2))
}
