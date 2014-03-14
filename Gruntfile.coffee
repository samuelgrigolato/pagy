
module.exports = (grunt) ->
  
  version = '0.1'
  
  files = {}
  files["pagy-#{version}.js"] = [ 'src/*.coffee' ] 
  files["pagy-#{version}.tests.js"] = [ 'test/*.coffee' ]
  
  config = 
    coffee:
      compile:
        options:
          sourceMap: true
        files: files
    qunit:
      all: [ 'pagy.tests.html' ]
    watch: 
      all:
        files: [ 'src/*.coffee', 'test/*.coffee', 'pagy*.html' ]
        tasks: 'default'
  
  grunt.initConfig config
  
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  
  grunt.registerTask 'default', [ 'coffee', 'qunit' ]