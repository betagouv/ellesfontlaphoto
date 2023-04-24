//= require active_admin/base
//= require activeadmin/quill_editor/quill
//= require activeadmin/quill_editor_input

$(document).ready(function(){
  document.querySelectorAll('.ql-editor').forEach((element) => {
    element.addEventListener('paste', (event) => {
      event.stopPropagation();
      event.preventDefault();
      console.log(element.innerHTML)
      let pastedData = event.clipboardData.getData('text');
      element.innerText = pastedData
    })
  })
})
