// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "initFlatpickr"
// import { initFlatpickr  } from "./plugins/init_flatpickr";
// // document.addEventListener("turbolinks:load", ()=>{
// //   flatpickr()
// // })
// console.log("Hello one")
// initFlatpickr()
import flatpickr from "flatpickr"

const foo = () => {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#car-booking-dates').dataset.unavailable)
    endDateInput.disabled = true
    // console.log(startDateInput);
    // console.log(endDateInput);
    // console.log(unavailableDates);
    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d",
    });

    console.log('im in the file')

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        dateFormat: "Y-m-d"
      });
    })
  };
}
foo()
