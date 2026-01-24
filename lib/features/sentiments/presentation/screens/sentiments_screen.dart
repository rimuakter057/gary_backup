import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentimentsScreen extends StatelessWidget {
  const SentimentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB), // Light background
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildToggleTabs(), // All Instruments / Watchlist
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  SizedBox(height: 15.h),
                  _buildCategoryChips(), // All, Forex, Indices etc.
                  SizedBox(height: 20.h),

                  _sectionTitle("Extreme Watchlist"),
                  _sentimentCard("XAUUSD", "Forex", "+6% vs 24h", 68, 32, "HIGH"),
                  _sentimentCard("XAUUSD", "Forex", "+6% vs 24h", 68, 32, "HIGH"),

                  SizedBox(height: 15.h),
                  _sectionTitle("Other Instruments"),
                  _sentimentCard("XAUUSD", "Forex", "+6% vs 24h", 68, 32, "HIGH"),
                  _sentimentCard("EURUSD", "Forex", "+3% vs 24h", 55, 45, "MEDIUM"),
                  _sentimentCard("GOOGL", "Stocks", "0% vs 24h", 40, 60, "LOW"),
                  _sentimentCard("BTCUSD", "Crypto", "+5% vs 24h", 65, 35, "HIGH"),
                  SizedBox(height: 100.h), // Bottom navigation space
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sentiment Card Component
  Widget _sentimentCard(String pair, String cat, String change, int buy, int sell, String risk) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pair, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  Text("$cat • $change", style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                ],
              ),
              _riskBadge(risk),
            ],
          ),
          SizedBox(height: 15.h),
          _sentimentBar(buy, sell),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(child: _actionButton("Analyze", isOutlined: true)),
              SizedBox(width: 10.w),
              Expanded(child: _actionButton("Details", isOutlined: false)),
            ],
          )
        ],
      ),
    );
  }

  // Buy/Sell Sentiment Bar (Red & Green Dashed style)
  Widget _sentimentBar(int buy, int sell) {
    return Row(
      children: [
        Text("$buy%", style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: List.generate(20, (index) {
                // Splits the 20 segments based on buy percentage
                bool isBuy = index < (buy / 5);
                return Expanded(
                  child: Container(
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    decoration: BoxDecoration(
                      color: isBuy ? Colors.redAccent : Colors.greenAccent,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Text("$sell%", style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _riskBadge(String label) {
    Color color = label == "HIGH" ? Colors.teal : (label == "LOW" ? Colors.red : Colors.orange);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 8.sp, fontWeight: FontWeight.bold)),
    );
  }

  Widget _actionButton(String label, {required bool isOutlined}) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : const Color(0xFF00A693),
        borderRadius: BorderRadius.circular(8.r),
        border: isOutlined ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isOutlined ? Colors.black : Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Common Header/UI Elements
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text("Sentiments", style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold)),
      leading: Icon(Icons.grid_view_rounded, color: const Color(0xFF00A693)),
      actions: [Icon(Icons.notifications_none, color: Colors.black), Icon(Icons.tune, color: Colors.black), SizedBox(width: 15.w)],
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(color: const Color(0xFFE0E4E7), borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          _tab("All Instruments", true),
          _tab("Watchlist", false),
        ],
      ),
    );
  }

  Widget _tab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF00A693) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.black54, fontSize: 12.sp))),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: const Icon(Icons.mic, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildCategoryChips() {
    List<String> cats = ["All", "Forex", "Indices", "Crypto", "Commodities"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cats.map((e) => Container(
          margin: EdgeInsets.only(right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: e == "All" ? const Color(0xFF00A693).withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: e == "All" ? const Color(0xFF00A693) : Colors.transparent),
          ),
          child: Text(e, style: TextStyle(color: e == "All" ? const Color(0xFF00A693) : Colors.black54, fontSize: 12.sp)),
        )).toList(),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
    );
  }
}