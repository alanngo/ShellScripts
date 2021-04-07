function api()
{
  local URL=$1
  local METHOD=$2
  curl -I -X OPTIONS \
    -H "Origin: ${MY_URL}" \
    -H "Access-Control-Request-Method: ${METHOD}" \
    "${MY_URL}" 2>&1 | grep -i 'Access-Control-Allow-Origin'
}


MY_URL=$1
METHOD=${2:-"GET"}
echo "using $METHOD method"
api $MY_URL $METHOD
