package net.twom6res.datausageqs

import android.app.usage.NetworkStatsManager
import android.content.*
import android.icu.util.Calendar
import android.net.ConnectivityManager
import java.util.Locale

object DataUsageHelper {

    fun getMonthlyMobileDataUsage(context: Context): String {
        val statsManager = context.getSystemService(Context.NETWORK_STATS_SERVICE) as NetworkStatsManager

        val now = System.currentTimeMillis()
        val startOfMonth = Calendar.getInstance().apply {
            set(Calendar.DAY_OF_MONTH, 1)
            set(Calendar.HOUR_OF_DAY, 0)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }.timeInMillis

        val bucket = statsManager.querySummaryForDevice(
            ConnectivityManager.TYPE_MOBILE,
            null,
            startOfMonth,
            now
        )


        val totalBytes = bucket.rxBytes + bucket.txBytes
        return String.format("%.1f MB used", totalBytes / (1024.0 * 1024))
    }
}
