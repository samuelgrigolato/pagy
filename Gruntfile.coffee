
module.exports = (grunt) ->
  
  version = '0.1'
  
  coffee_files = {}
  coffee_files["pagy-#{version}.js"] = [ 'src/*.coffee' ] 
  coffee_files["pagy-#{version}.tests.js"] = [ 'test/*.coffee' ]
  
  less_files = {}
  less_files["css/pagy-#{version}.css"] = [ 'less/pagy.less' ]
  
  config = 
    coffee:
      compile:
        options:
          sourceMap: true
        files: coffee_files
    qunit:
      all: [ 'pagy.tests.html' ]
    watch: 
      all:
        files: [ 'src/*.coffee', 'test/*.coffee', 'less/pagy.less', 'pagy*.html' ]
        tasks: 'default'
    less:
      compile:
        files: less_files
  
  grunt.initConfig config
  
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-less'
  
  grunt.registerTask 'default', [ 'coffee', 'qunit', 'less' ]
  grunt.registerTask 'heroku:production', [ 'default' ]