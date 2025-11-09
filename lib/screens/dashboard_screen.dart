import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../theme/app_theme.dart';
import '../widgets/summary_card.dart';
import '../widgets/transaction_tile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  List<MoneyTransaction> get _sampleTransactions => [
        MoneyTransaction(
          title: 'Salary',
          amount: 4200,
          date: DateTime.now().subtract(const Duration(days: 2)),
          category: 'Main Job',
          type: TransactionType.income,
        ),
        MoneyTransaction(
          title: 'Groceries',
          amount: 185.60,
          date: DateTime.now().subtract(const Duration(days: 1)),
          category: 'Food & Drinks',
          type: TransactionType.expense,
        ),
        MoneyTransaction(
          title: 'Gym Membership',
          amount: 50.0,
          date: DateTime.now().subtract(const Duration(days: 4)),
          category: 'Health',
          type: TransactionType.expense,
        ),
        MoneyTransaction(
          title: 'Freelance Design',
          amount: 620,
          date: DateTime.now().subtract(const Duration(days: 6)),
          category: 'Side Hustle',
          type: TransactionType.income,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final transactions = _sampleTransactions;
    final income = transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold<double>(0, (previousValue, element) => previousValue + element.amount);
    final expenses = transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold<double>(0, (previousValue, element) => previousValue + element.amount);
    final balance = income - expenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Money App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              _buildBalanceCard(context, balance, income, expenses),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'Income',
                      amount: '\$${income.toStringAsFixed(2)}',
                      trendDescription: 'Up by 12% compared to last month',
                      icon: Icons.arrow_downward_rounded,
                      color: AppTheme.incomeColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SummaryCard(
                      title: 'Expenses',
                      amount: '\$${expenses.toStringAsFixed(2)}',
                      trendDescription: 'Down by 5% compared to last month',
                      icon: Icons.arrow_upward_rounded,
                      color: AppTheme.expenseColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Recent Activity',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View all'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => TransactionTile(
                    transaction: transactions[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(height: 0),
                  itemCount: transactions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 64,
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard_rounded),
            label: 'Overview',
          ),
          NavigationDestination(
            icon: Icon(Icons.pie_chart_outline),
            selectedIcon: Icon(Icons.pie_chart),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallets',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Transaction'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBalanceCard(
    BuildContext context,
    double balance,
    double income,
    double expenses,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4158D0),
            Color(0xFFC850C0),
            Color(0xFFFFCC70),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            '\$${balance.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 32,
                ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _BalancePill(
                label: 'Income',
                amount: income,
                color: AppTheme.incomeColor,
              ),
              const SizedBox(width: 12),
              _BalancePill(
                label: 'Expenses',
                amount: expenses,
                color: AppTheme.expenseColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalancePill extends StatelessWidget {
  const _BalancePill({
    required this.label,
    required this.amount,
    required this.color,
  });

  final String label;
  final double amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
