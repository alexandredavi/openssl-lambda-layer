const { execSync } = require('child_process')

exports.handler = async(event, context) => {
    execSync(' openssl genrsa -out testCert.key 2048', { encoding: 'utf8', stdio: 'inherit' })
}
