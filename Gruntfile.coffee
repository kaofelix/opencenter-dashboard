module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig
    coffee:
      compile:
        files: [
          expand: true,
          cwd: 'source/coffee/',
          src: '**/*.coffee',
          dest: 'public/js/',
          ext: '.js'
        ]
    jade:
      compile:
        files: [
          "public/index.html": ["views/*.jade"]
        ]
    copy:
      main:
        files: [
          expand: true
          cwd: "source/js/"
          src: "**"
          dest: "public/js/"
        ,
          expand: true
          cwd: "source/css/"
          src: "**"
          dest: "public/css/"
        ,
          expand: true
          cwd: "source/img/"
          src: "**"
          dest: "public/img/"
        ]
    watch:
      coffee:
        files: ['source/coffee/**/*.coffee'],
        tasks: ['coffee:compile']
      jade:
        files: ['views/**/*.jade'],
        tasks: ['jade:compile']

    karma:
      spec:
        configFile: 'karma.conf.coffee',
        singleRun: true

    clean: ["public/"]

  grunt.renameTask 'regarde', 'watch'

  grunt.registerTask 'spawnServer', ->
    fs = require('fs')
    out = fs.openSync('./dashboard.log', 'a')
    err = fs.openSync('./dashboard.log', 'a')

    grunt.util.spawn
      cmd: 'node'
      args: ['node_modules/node-dev/node-dev', 'dashboard.coffee']
      opts: stdio: ['ignore', out, err]

    # watch keeps the grunt process open so the server keeps open as well
    grunt.task.run('watch')

  grunt.registerTask 'server', [
    'default'
    'spawnServer'
  ]

  grunt.registerTask 'default', [
    'jade:compile'
    'coffee:compile'
    'copy:main'
  ]