//text field suggest value script start//
function textOnFocus(textBox){
    textBox.className='suggest_textfield_highlight';
    if(textBox.value==textBox.defaultValue){
        textBox.value='';
    }
}
function textOnBlur(textBox){
    textBox.className='suggest_textfield_normal';
    if(textBox.value==''){
        textBox.value=textBox.defaultValue;
        }
    if(textBox.value==textBox.defaultValue){
        textBox.className='suggest_textfield_default_normal';
    }
}
//text field suggest value script end//