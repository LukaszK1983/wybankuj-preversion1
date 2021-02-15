$(document).ready(function () {
    // contactform.jsp
    const button = $('button');

    function check() {
        const form = $('form');
        let testUser = true;
        let testEmail = true;
        let testPhone = true;
        let testAgree = true;
        let testDog = true;

        const userElement = $('#formuser');
        const user = userElement.val();
        const regexUser = new RegExp('^[a-zA-ZąćęłŁńóśŚźżŻ\\-\\s]+$');
        const validuser = $('#validuser').hide();

        if (!regexUser.test(user)) {
            validuser.show();
            userElement.css('border', '1px solid #C24754');
            userElement.css('box-shadow', '0 0 10px 1px #C24754');
            testUser = false;
        } else {
            userElement.css('border', '1px solid green');
            userElement.css('box-shadow', '0 0 0 0');
            testUser = true;
        }

        const emailElement = $('#formemail');
        const email = emailElement.val();
        const regexEmail = new RegExp('^[a-zA-Z.-_\\d]+@[a-z-\\d]+(\\.[a-z]+){1,}$');
        const validemail = $('#validemail').hide();

        if (!regexEmail.test(email)) {
            validemail.show();
            emailElement.css('border', '1px solid #C24754');
            emailElement.css('box-shadow', '0 0 10px 1px #C24754');
            testEmail = false;
        } else {
            emailElement.css('border', '1px solid green');
            emailElement.css('box-shadow', '0 0 0 0');
            testEmail = true;
        }

        const phoneElement = $('#formphone');
        const phone = phoneElement.val();
        const regexPhone = new RegExp('^\\d{9}$');
        const validphone = $('#validphone').hide();

        if (!regexPhone.test(phone)) {
            validphone.show();
            phoneElement.css('border', '1px solid #C24754');
            phoneElement.css('box-shadow', '0 0 10px 1px #C24754');
            testPhone = false;
        } else {
            phoneElement.css('border', '1px solid green');
            phoneElement.css('box-shadow', '0 0 0 0');
            testPhone = true;
        }

        const agreeElement = $('#formagree');
        const validagree = $('#validagree').hide();

        if (!agreeElement.is(':checked')) {
            validagree.show();
            agreeElement.css('border', '1px solid #C24754');
            agreeElement.css('box-shadow', '0 0 10px 1px #C24754');
            testAgree = false;
        } else {
            agreeElement.css('border', '1px solid green');
            agreeElement.css('box-shadow', '0 0 0 0');
            testAgree = true;
        }

        const dogElement = $('#formdog').hide();
        const dog = dogElement.val();

        if (dog === '') {
            dogElement.css('border', '1px solid green');
            dogElement.css('box-shadow', '0 0 0 0');
            testDog = true;
        } else {
            dogElement.css('border', '1px solid #C24754');
            dogElement.css('box-shadow', '0 0 10px 1px #C24754');
            testDog = false;
        }


        if (testUser === true && testEmail === true && testPhone === true && testAgree === true && testDog === true) {
            const message = $('#formmessage');
            const firstPart = message.val() + '<br /><br />';
            const namePart = 'Imię i nazwisko: ' + user + '<br />';
            const phonePart = 'Telefon: ' + phone + '<br />';
            const mailPart = 'E-mail: ' + email;
            const messageToSend = firstPart + namePart + phonePart + mailPart;
            console.log('Total: ' + messageToSend);
            message.val(messageToSend).hide();
            form.submit();
        }
    }
    button.on('click', function (e) {
        e.preventDefault();
        check();
    });

    // --->
});