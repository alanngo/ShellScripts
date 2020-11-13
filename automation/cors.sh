MY_URL=${1}

curl -I -X OPTIONS \
  -H "Origin: ${MY_URL}" \
  -H 'Access-Control-Request-Method: GET' \
  "${MY_URL}/SOMETHING" 2>&1 | grep -i 'Access-Control-Allow-Origin'