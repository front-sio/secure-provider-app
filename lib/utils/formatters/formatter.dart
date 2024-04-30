import 'package:intl/intl.dart';

class SecuriteFormatter {
  static String formatDate (DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-mm-yyyy').format(date);
  }

  static String formatCurrency (double amount){
    return NumberFormat.currency(locale: 'en_US', symbol: 'Tsh').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    if (phoneNumber.length == 10){
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }else  if (phoneNumber.length == 11){
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(3, 7)} ${phoneNumber.substring(7)}';
    }

    return phoneNumber;
  }

  // static String internationalFormatPhoneNumber(String phoneNumber){
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

  //   // extract country code from digitsOnly
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);


  //   // Add the remaing digits with proper formatting
  //   final formattedPhoneNumber = StringBuffer();
  //   formattedPhoneNumber.write('($countryCode)');

  //   int i = 0;
  //   while (i < digitsOnly.length){
  //     int groupLength = 2;
  //     if (i == 0 && countryCode == '+255'){
  //       groupLength = 4;
  //     }

  //     int end = i + groupLength;
  //     formattedPhoneNumber.write(digitsOnly.substring(i, end));

  //     if (end < digitsOnly.length){
  //       formattedPhoneNumber.write(' ');
  //     }

  //     i = end;
  //   }

    
  // }

  
}