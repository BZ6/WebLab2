import {showError} from "../toast/notifications.js";
import {addToTable} from "./shotTable.js";
import {drawPoint} from "../graph/plot.js";

export async function handleShots(x, y, r) {
    if (!r) {
        showError("R is not set!")
        return
    }

    const response = await fetch("controller", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({x, y, r}),
    })
    const responseData = await response.json()
    if (response.ok) {
        drawPoint(x, y, r, responseData.inArea)
        responseData.y = y
        addToTable(responseData)
        console.log(y) //смотрю вывод программы
    } else if (response.status === 400) showError(responseData.error)
    else showError('Server error.')
}