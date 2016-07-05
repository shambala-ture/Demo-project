function validateform() {
  
  var billingAddressLength = $(".billing:checked").length;
  if (billingAddressLength > 1 || billingAddressLength == 0) {
    alert("Select only one billing address.");
    return false
  }

  var shippingAddressLength = $(".shipping:checked").length;
  if (shippingAddressLength > 1 || shippingAddressLength == 0) {
    alert("Select only one shipping address.");
    return false
  }
  else {
    return true
  }
}