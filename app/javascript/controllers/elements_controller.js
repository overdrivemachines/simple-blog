import { Controller } from "stimulus"

export default class extends Controller {
  sort() {
    console.log("Sorting elements...");
    let element = document.getElementById('elements');
    let element_items = Array.from(document.getElementsByClassName("element-item"));
    let elements = element_items.map((element, index) => {
      return ({id: element.dataset.id, position: index + 1});
    });
    console.log(elements);
  }
}