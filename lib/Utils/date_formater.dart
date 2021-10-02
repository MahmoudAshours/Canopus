String dateFormater(String date) =>
    "${DateTime.parse(date).day}-${DateTime.parse(date).month}-${DateTime.parse(date).year % 100}";
