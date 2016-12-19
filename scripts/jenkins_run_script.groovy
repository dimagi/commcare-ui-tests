stage('build') {
    build job: 'commcare-odk-build-tests'
}

stage('test') {
    try {
        echo 'Running tests...'
        retry(3) {
            echo 'Testing @Setup'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@Setup']]
        }
        retry(3) {
            echo 'Testing @CaseSharing'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@CaseSharing']]
        }
        retry(3) {
            echo 'Test @Fixtures'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@Fixtures']]
        }
        retry(3) {
            echo 'Testing @FormSettings'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@FormSettings']]
        }
        retry(3) {
            echo 'Testing @FormEntry'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@FormEntry']]
        }
        retry(3) {
            echo 'Test @Languages'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@Languages']]
        }
        retry(3) {
            echo 'Testing @CaseListSearch'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@CaseListSearch']]
        }
        retry(3) {
            echo 'Testing @CaseListSort'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@CaseListSort']]
        }
        retry(3) {
            echo 'Test @Login'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@Login']]
        }
        retry(3) {
            echo 'Testing @Settings'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@Settings']]
        }
        retry(3) {
            echo 'Testing @MenuTests'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@MenuTests']]
        }
        retry(3) {
            echo 'Test @FormFiltering'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@FormFiltering']]
        }
        retry(3) {
            echo 'Test @SessionExpiration'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@SessionExpiration']]
        }
        retry(3) {
            echo 'Testing @Dialogs'
            build job: 'commcare-odk-tests', parameters: [[$class: 'StringParameterValue', name: 'TAG_NAME', value: '@Dialogs']]
        }
        currentBuild.result = 'SUCCESS'
    } catch(error) {
        currentBuild.result = 'FAILURE'
        throw error
    } finally {
        if (currentBuild.result == 'SUCCESS') {
            slackSend color: 'good', message: 'Amazon device farm tests passed.'
        } else {
            slackSend color: 'bad', message: 'Amazon device farm tests failed, feel bad!'
            mail (to: 'mobiledev@dimagi.com',
                subject: "Amazon device farm tests failed.",
                body: "Amazon device farm tests failed.");
        }

    }
}