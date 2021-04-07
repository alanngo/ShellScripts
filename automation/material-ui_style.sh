COMPONENT=${1:-"MyStyle"}
echo "
import {makeStyles} from '@material-ui/core/styles'

const useStyles = makeStyles(theme => 
(
    {} // create styles here
));
export {useStyles}
" >> $COMPONENT".js"
echo "done"