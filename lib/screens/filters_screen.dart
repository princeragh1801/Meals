import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-scren';
  final Function saveFilters;
  final Map<String, bool> currFilters;
  FiltersScreen(this.currFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currFilters['gluten'];
    _lactoseFree = widget.currFilters['lactose'];
    _vegan = widget.currFilters['vegan'];
    _vegetarian = widget.currFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currVal, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currVal,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filetes'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only gluten-free meals', _glutenFree,
                  (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              _buildSwitchListTile(
                  'Lactose-free', 'Only lactose-free meals', _lactoseFree,
                  (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
              _buildSwitchListTile('Vegetarian', 'Only veg meals', _vegetarian,
                  (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only vegan meals', _vegan,
                  (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
            ],
          ),
        )
      ]),
    );
  }
}
