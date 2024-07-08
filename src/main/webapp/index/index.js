import {configureFields} from "../shot/shotForm.js";
import {drawPlot} from "../graph/plot.js";
import {clearTable} from "../shot/shotTable.js";

configureFields()
drawPlot()
document.querySelector('.clear-button').addEventListener('click', function() {
    clearTable()
    drawPlot()
})
