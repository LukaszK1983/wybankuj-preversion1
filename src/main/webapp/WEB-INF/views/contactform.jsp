<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Formularz kontaktowy</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/appcontact.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/pl_PL/sdk.js#xfbml=1&version=v6.0"></script>

<div class="div-header">
    <%@ include file="/WEB-INF/JSPF/mainheader2.jspf" %>
</div>

<div class="container">
    <h3 class="h3-details">
        <img src="<c:url value="/img/${bank.get().logo}" />" alt="${bank.get().bankName}" class="img-h3"/>
        <span class="span-h3"> - Formularz kontaktowy</span>
    </h3>

    <c:choose>
        <c:when test="${empty answear}">
            <div class="form-group" style="text-align: center">
                <form action="${pageContext.request.contextPath}/loanParameters" method="post">
                    <input type="hidden" name="bankId" value="${bank.get().id}"/>
                    <input type="hidden" name="amount" value="${userLoan.amount}"/>
                    <input type="hidden" name="creditPeriod" value="${userLoan.creditPeriod}"/>
                    <input type="hidden" name="offer" value="${offer}"/>
                    <input type="hidden" name="age" value="${userLoan.age}"/>
                    <input type="hidden" name="chooseServiceCharge" value="${userLoan.chooseServiceCharge}"/>
                    <input type="hidden" name="chooseInsurance" value="${userLoan.chooseInsurance}"/>
                    <p><input type="submit" value="Lista ofert" class="btn btn-sm btn-warning rounded"/></p>
                </form>
            </div>
        </c:when>
        <c:otherwise>
            <h4 class="h4-send-msg">Wiadomość została wysłana. Dziękujemy za kontakt.</h4>

            <div class="form-group" style="text-align: center">
                <form action="${pageContext.request.contextPath}/loanParameters" method="post">
                    <input type="hidden" name="bankId" value="${bank.get().id}"/>
                    <input type="hidden" name="amount" value="${userLoan.amount}"/>
                    <input type="hidden" name="creditPeriod" value="${userLoan.creditPeriod}"/>
                    <input type="hidden" name="offer" value="${offer}"/>
                    <input type="hidden" name="age" value="${userLoan.age}"/>
                    <input type="hidden" name="chooseServiceCharge" value="${userLoan.chooseServiceCharge}"/>
                    <input type="hidden" name="chooseInsurance" value="${userLoan.chooseInsurance}"/>
                    <p><input type="submit" value="Lista ofert" class="btn btn-sm btn-warning rounded"/></p>
                </form>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="div-contact-form">
        <form action="${pageContext.request.contextPath}/agencyContactForm" method="post">
            <div class="form-group">
                <label for="formuser" class="label-title">Imię i nazwisko:</label>
                <input type="text" class="form-control" id="formuser" placeholder="Wprowadź imię i nazwisko"
                name="name">
                <div class="invalid-feedback" id="validuser">Wprowadzono błędne dane</div>
            </div>
            <div class="form-group">
                <label for="formemail" class="label-title">E-mail:</label>
                <input type="text" class="form-control" id="formemail" placeholder="Wprowadź e-mail" name="email">
                <div class="invalid-feedback" id="validemail">Wprowadzono błędne dane - poprawny format: mail@mail.pl
                </div>
            </div>
            <div class="form-group">
                <label for="formphone" class="label-title">Telefon:</label>
                <input type="text" class="form-control" id="formphone" placeholder="Wprowadź nr telefonu - 9 cyfr"
                name="phone">
                <div class="invalid-feedback" id="validphone">Wprowadzono błędne dane - poprawny format: 000000000</div>
            </div>
            <div class="form-group">
                <label for="formmessage" class="label-title">Wiadomość:</label>
                <textarea class="form-control" id="formmessage" rows="7" name="message" style="color: #BF4042">
                Dzień dobry,
                interesuje mnie kredyt w ofercie ${offer} w kwocie ${userLoan.amount} zł na okres ${userLoan.creditPeriod} miesięcy. Proszę o kontakt.
                Pozdrawiam
                </textarea>
            </div>
            <div class="form-group form-check">
                <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id="formagree" value="" checked>Wyrażam zgodę na kontakt doradcy banku ${bank.get().bankName} w celu przekazania mi informacji dotyczących szczegółów oferty banku, wymaganej listy dokumentów oraz kolejnych kroków procesu kredytowego, a także na przedstawienie propozycji spotkania w placówce banku.
                </label>
                <div class="invalid-feedback" id="validagree">
                    Wyrażenie powyższej zgody jest dobrowolne, ale jednocześnie konieczne, aby pracownik banku mógł się z Tobą skontaktować.
                </div>
            </div>

            <div class="form-group">
            	<div class="col-md-12 g-recaptcha" data-sitekey="6LeFXVkaAAAAAGLcOtiiYj8I-oHtJsUa9pddFjQm"></div>
            </div>

            <div class="form-group" style="text-align: center">
                <input type="hidden" name="bankId" value="${bank.get().id}"/>
                <input type="hidden" name="amount" value="${userLoan.amount}"/>
                <input type="hidden" name="creditPeriod" value="${userLoan.creditPeriod}"/>
                <input type="hidden" name="offer" value="${offer}"/>
                <input type="hidden" name="age" value="${userLoan.age}"/>
                <input type="hidden" name="chooseServiceCharge" value="${userLoan.chooseServiceCharge}"/>
                <input type="hidden" name="chooseInsurance" value="${userLoan.chooseInsurance}"/>
                <button type="submit" class="btn btn-primary rounded">WYŚLIJ</button>
            </div>
        </form>
    </div>
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf" %>
</div>

</body>
</html>