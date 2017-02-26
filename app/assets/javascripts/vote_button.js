$(document).ready(function(){
  $('#solution-one').click(function(event){
    event.preventDefault();
    postWinningSolution(this);
  })
})


function postWinningSolution(solution){
  axios.post('/')
}
