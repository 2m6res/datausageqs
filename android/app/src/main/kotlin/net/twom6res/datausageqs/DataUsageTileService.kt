package net.twom6res.datausageqs

import android.annotation.SuppressLint
import android.annotation.TargetApi
import android.app.AppOpsManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import net.twom6res.datausageqs.DataUsageHelper.getMonthlyMobileDataUsage
import java.util.Locale
import kotlin.properties.Delegates

class DataUsageTileService : TileService() {
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    private var dataUsagePermMode by Delegates.notNull<Int>()

    override fun onCreate() {
        super.onCreate()

        val appOps = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        dataUsagePermMode = appOps.checkOpNoThrow(
            AppOpsManager.OPSTR_GET_USAGE_STATS,
            applicationInfo.uid,
            packageName
        )
    }


    override fun onStartListening() {
        super.onStartListening()
        if (dataUsagePermMode == AppOpsManager.MODE_ALLOWED) {
            serviceScope.launch {
                val dataUsage = getMonthlyMobileDataUsage(this@DataUsageTileService)
                qsTile.label = dataUsage
            }
            qsTile.updateTile()
        } else {
            qsTile.label = String.format("Missing permission, check the app.")
            qsTile.updateTile()
        }
    }
}
