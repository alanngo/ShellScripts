function classComp()
{
    local COMP_NAME=$1
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
    export default $COMP_NAME;" >>$COMP_NAME".js"
}

function funcComp()
{
    local COMP_NAME=$1
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

    export default $COMP_NAME;" >>$COMP_NAME".js"
}

COMP_NAME=$1
echo "create functional component? "
read FUNCTIONAL

if [ $FUNCTIONAL == 'y' ] || [ $FUNCTIONAL == 'Y' ]; then
    funcComp $COMP_NAME
else 
    classComp $COMP_NAME
fi
echo "done"