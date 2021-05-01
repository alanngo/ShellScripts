function classComp()
{
    local COMP_NAME=$1
    local DIR=$2
    echo "
import React, {Component} from 'react';
class $COMP_NAME extends Component 
{

    render()
    {
        return (
        <div className='$COMP_NAME'>
        <h1>Implement $COMP_NAME</h1>
        </div>
        )
    }
}
export default $COMP_NAME;" >>$DIR"/"$COMP_NAME".tsx"
}

function funcComp()
{
    local COMP_NAME=$1
    local DIR=$2
    echo "
import React from 'react';

const $COMP_NAME = () => 
{
    return (
        <div className='$COMP_NAME'>
        <h1>Implement $COMP_NAME</h1>
        </div>
    )
}

export default $COMP_NAME;" >>$DIR"/"$COMP_NAME".tsx"
}

COMP_NAME=${1:-"MyComponent"}
if [ $COMP_NAME == 'help' ]; then
    echo "DEFAULT: create functional component in current dir"
    echo "ARGS: <COMPONENT_NAME> <DIRECTORY> <FUNCTIONAL>"
    echo "RECCOMMENDED: bash generate_component.sh <COMPONENT_NAME>"
    exit 0
fi
DIR=${2:-"."}
FUNCTIONAL=${3:-"f"}

if [ $FUNCTIONAL == 'f' ] || [ $FUNCTIONAL == 'F' ]; then
    funcComp $COMP_NAME $DIR
else 
    classComp $COMP_NAME $DIR
fi
echo "done"