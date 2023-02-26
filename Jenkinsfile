pipeline {
    /*if you want to execute on specific node use:
        agent { label 'mac-mini-slave-local' }
    */
    agent any

    stages {
        parameters {
        // the default choice for commit-triggered builds is the first item in the choices list
        choice(name: 'buildType', choices: ['Scan-only', 'Debug-firebaseDistribution', 'Release-AppStore-TestFlight'],
               description: 'The build types')
        booleanParam(name: 'Push_To_Remote', defaultValue: false, description: 'Toggle to push changes back to remote(check for repo permission on this)')
        }
        
        stage('Print Selected Values') {
            steps {
                echo 'Selected Values are: \n'
                echo params.buildType
                echo 'environment variables are: \n'
                echo env
            }
        }
    }
}


