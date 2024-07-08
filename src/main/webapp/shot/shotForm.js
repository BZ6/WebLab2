import {handleShots} from "./shotHandler.js";
import {drawPlot} from "../graph/plot.js";
import {showError} from "../toast/notifications.js";

const form = document.querySelector('.shot-form')
form.addEventListener('submit', async function (event) {
    event.preventDefault()
    const parseNumber = (numberString) => parseFloat(numberString.replace(',', '.'))

    const formData = new FormData(form)
    const x = parseNumber(formData.get('x'))
    const y = formData.get('y').replace(',', '.')
    const r = parseNumber(formData.get('r'))
    if (!validateCoordinates(x, y, r)) {
        showError("Wrong HTML")
    }
    await handleShots(formData.get('x'), y, formData.get('r'))
})

export function configureFields() {
    document.querySelectorAll('input[type="radio"][name="x"]').forEach((xRadio) => {
        xRadio.addEventListener('change', () => {
            if (xRadio.value)
            sessionStorage.x = xRadio.value
        })
    })
    if (sessionStorage.x) document.querySelector(`input[type="radio"][name="x"][value="${sessionStorage.x}"]`).checked = true

    const yField = form.querySelector('input[name="y"]')
    if (sessionStorage.y) yField.value = sessionStorage.y
    yField.addEventListener('change', () => {
        sessionStorage.y = yField.value
    })

    document.querySelectorAll('input[type="radio"][name="r"]').forEach((rRadio) => {
        if (rRadio.checked)
            sessionStorage.r = rRadio.value
        rRadio.addEventListener('change', () => {
            sessionStorage.r = rRadio.value
            drawPlot()
        })
    })
    if (sessionStorage.r) document.querySelector(`input[type="radio"][name="r"][value="${sessionStorage.r}"]`).checked = true
}

function validateCoordinates(x, y, r) {
    if (isNaN(y) || parseFloat(y) < -3 || parseFloat(y) > 3){
        return false
    } else if (!([-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2].includes(parseFloat(x)) && !isNaN(x))){
        return false
    } else return [1, 1.5, 2, 2.5, 3].includes(parseFloat(r)) && !isNaN(r);
}
