const { execSync } = require('child_process')

exports.handler = async(event, context) => {
    execSync('openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365', { encoding: 'utf8', stdio: 'inherit' })
}
