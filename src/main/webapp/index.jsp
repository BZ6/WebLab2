<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Lab work #2</title>
    <link rel="stylesheet" href="style/styles.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="module" src="index/index.js"></script>
    <script type="module" src="graph/plot.js"></script>
    <script type="module" src="shot/shotForm.js"></script>
    <script type="module" src="shot/shotHandler.js"></script>
    <script type="module" src="shot/shotTable.js"></script>
    <script defer type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</head>
<body>
<header>
    <div class="student-info">
        <h2>Zaharkin Bogdan Vladimirovich, P3209</h2>
        <h2>Variant 90834</h2>
    </div>
</header>
<div class="main">
    <div class="control">
        <div class="plot">
            <canvas id="plot__canvas" width="550" height="550"></canvas>
        </div>
        <form class="shot-form">
            <div class="input-block">
                <span class="input-label">X:</span>
                <div class="input-group">
                    <input type="radio" name="x" value="-2" id="x-2" checked required/>
                    <label class="radio-label" for="x-2">-2</label>
                    <input type="radio" name="x" value="-1.5" id="x-1_5"/>
                    <label class="radio-label" for="x-1_5">-1.5</label>
                    <input type="radio" name="x" value="-1" id="x-1"/>
                    <label class="radio-label" for="x-1">-1</label>
                    <input type="radio" name="x" value="-0.5" id="x-0_5"/>
                    <label class="radio-label" for="x-0_5">-0.5</label>
                    <input type="radio" name="x" value="0" id="x0"/>
                    <label class="radio-label" for="x0">0</label>
                    <input type="radio" name="x" value="0.5" id="x0_5"/>
                    <label class="radio-label" for="x0_5">0.5</label>
                    <input type="radio" name="x" value="1" id="x1"/>
                    <label class="radio-label" for="x1">1</label>
                    <input type="radio" name="x" value="1.5" id="x1_5"/>
                    <label class="radio-label" for="x1_5">1.5</label>
                    <input type="radio" name="x" value="2" id="x2"/>
                    <label class="radio-label" for="x2">2</label>
                </div>
            </div>
            <div class="input-block">
                <span class="input-label">Y:</span>
                <div class="input-group">
                    <input
                            name="y"
                            type="text"
                            class="text-input"
                            placeholder="from -3.0 to 3.0"
                            pattern="(?:-3|\+?3)(?:[.,]0+)?|(?:-[210]|\+?[012])(?:[.,]\d+)?"
                            autofocus
                            required
                    />
                </div>
            </div>
            <div class="input-block">
                <span class="input-label">R:</span>
                <div class="input-group">
                    <input type="radio" name="r" value="1" id="r1" checked required/>
                    <label class="radio-label" for="r1">1</label>
                    <input type="radio" name="r" value="1.5" id="r1_5"/>
                    <label class="radio-label" for="r1_5">1.5</label>
                    <input type="radio" name="r" value="2" id="r2"/>
                    <label class="radio-label" for="r2">2</label>
                    <input type="radio" name="r" value="2.5" id="r2_5"/>
                    <label class="radio-label" for="r2_5">2.5</label>
                    <input type="radio" name="r" value="3" id="r3"/>
                    <label class="radio-label" for="r3">3</label>
                </div>
            </div>
            <input type="submit" value="Shoot" class="button submit-button"/>
        </form>
        <button class="button clear-button">Clear Table</button>
    </div>
    <div class="table">
        <table id="shot-table">
            <thead>
            <tr>
                <th>№</th>
                <th>Shot</th>
                <th>Time</th>
                <th>Result</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="i" value="${model.size()}" />
            <c:forEach var="shot" items="${model.array()}">
                <tr>
                    <c:out escapeXml="false" value="<td>${i}</td>"/>
                    <c:out escapeXml="false" value="<td>(${shot.x}; ${shot.y}; ${shot.r})</td>"/>
                    <c:out escapeXml="false" value="<td>${shot.requestTime} (${shot.executionDuration})</td>"/>
                    <c:out escapeXml="false" value="<td>${shot.inArea ? 'In' : 'Out'}</td>"/>
                    <c:set var="i" value="${i-1}"/>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
