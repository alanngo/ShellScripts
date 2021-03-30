#!/bin/bash
echo "What Would You Like To Name Your App?"
read nameofyourapp
npx create-react-app $nameofyourapp  --template typescript
