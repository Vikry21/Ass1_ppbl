import 'package:timeago/timeago.dart' as timeago;

class TimeagoService {
  // 1. Format default (Indonesia)
  static String formatTime(DateTime time) {
    return timeago.format(time, locale: 'id');
  }

  // 2. Format dengan locale tertentu
  static String formatWithLocale(DateTime time, String locale) {
    return timeago.format(time, locale: locale);
  }

  // 3. Ambil waktu sekarang
  static DateTime getNow() {
    return DateTime.now();
  }

  // 4. Kurangi menit
  static DateTime subtractMinutes(int minutes) {
    return DateTime.now().subtract(Duration(minutes: minutes));
  }

  // 5. Kurangi jam
  static DateTime subtractHours(int hours) {
    return DateTime.now().subtract(Duration(hours: hours));
  }

  // 6. Kurangi hari
  static DateTime subtractDays(int days) {
    return DateTime.now().subtract(Duration(days: days));
  }

  // 7. Cek apakah waktu di masa lalu
  static bool isPast(DateTime time) {
    return time.isBefore(DateTime.now());
  }

  // 8. Cek apakah waktu di masa depan
  static bool isFuture(DateTime time) {
    return time.isAfter(DateTime.now());
  }

  // 9. Selisih detik
  static int differenceInSeconds(DateTime time) {
    return DateTime.now().difference(time).inSeconds;
  }

  // 10. Selisih menit
  static int differenceInMinutes(DateTime time) {
    return DateTime.now().difference(time).inMinutes;
  }

  // 11. Selisih jam (bonus)
  static int differenceInHours(DateTime time) {
    return DateTime.now().difference(time).inHours;
  }
}