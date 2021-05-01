const { execSync } = require('child_process')

exports.handler = async(event, context) => {
    execSync(' openssl genrsa 2048', { encoding: 'utf8', stdio: 'inherit' })
}
