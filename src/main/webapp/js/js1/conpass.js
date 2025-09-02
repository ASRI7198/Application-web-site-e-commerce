
 function onChange() {
                    	  const password = document.querySelector('input[name=pass]');
                    	  const confirm = document.querySelector('input[name=passC]');
                    	  if (confirm.value === password.value) {
                    	    confirm.setCustomValidity('');
                    	  } else {
                    	    confirm.setCustomValidity('Les mots de passe ne correspondent pas');
                    	  }
                    	}