// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

  if(typeof(Stripe) === "undefined"){
    return;
  }

  Stripe.setPublishableKey($("meta[name='stripe-key']").attr("content"));

  $("#cc-form").submit(function(){
      $("#stripe-errors").html("");
      $("input[type='submit']").attr("disabled", true);
    card = {
      number: $("#_card_number").val(),
      cvc:   $("#_cvc").val(),
      expMonth: $("#date_month").val(),
      expYear: $('#date_year').val()
    }

    Stripe.createToken(card, handleStripeResponse);
    // preventDefault();
    // stopPropigation();
    return false;
  });

  handleStripeResponse = function(status, response){
    if (status===200){
$("#_stripe_token").val(response.id);
$("#token-form").submit(); 
    } else{
      $("#stripe-errors").html(response.error.message);
      // re-enable the submit button
      $("#input[type='submit']").removeAttr("disabled");
    }
    // console.log(status);
    // console.log(response);
  }

});