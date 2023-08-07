import 'dart:async';

import 'package:dreambit/data/models/app_user.dart';
import 'package:dreambit/data/enums/country.dart';
import 'package:dreambit/data/enums/gender.dart';
import 'package:flutter/material.dart';

class PersonDetailsWidget extends StatefulWidget {
  const PersonDetailsWidget({
    required this.onNext,
    super.key,
  });

  final void Function({
    required AppUser user,
    required Country nationality,
    required Gender gender,
  }) onNext;

  @override
  State<PersonDetailsWidget> createState() => _PersonDetailsWidgetState();
}

class _PersonDetailsWidgetState extends State<PersonDetailsWidget> {
  late final TextEditingController _nameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DateTime _firstDate = DateTime(1900, 1);
  final DateTime _lastDate = DateTime.now();

  bool _isFormValid = false;
  late final StreamController<bool> _formChangesStreamController;
  late final StreamSubscription<bool> _formChangesSubscription;

  DateTime? _selectedDate;
  String _dateOfBirth = 'dd/mm/yyyy';
  Gender? _selectedGender;
  Country? _selectedNationality;

  Future<void> _selectDate(BuildContext context) async {
    _globalUnfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? _lastDate,
      firstDate: _firstDate,
      lastDate: _lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateOfBirth =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      });
      _formChangesStreamController.add(true);
    }
  }

  List<DropdownMenuItem<Gender>>? _getGenderListItems() {
    return Gender.values.map<DropdownMenuItem<Gender>>((Gender value) {
      return DropdownMenuItem<Gender>(
        value: value,
        child: Text(value.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<Country>>? _getNationalityListItems() {
    return Country.values.map<DropdownMenuItem<Country>>((Country value) {
      return DropdownMenuItem<Country>(
        value: value,
        child: Text(value.name),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();

    _formChangesStreamController = StreamController<bool>.broadcast();
    _formChangesSubscription = _formChangesStreamController.stream.listen((_) {
      setState(() {
        if (_selectedDate != null &&
            _selectedGender != null &&
            _selectedNationality != null &&
            _nameController.text.isNotEmpty) {
          _isFormValid = true;
        } else {
          _isFormValid = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _formChangesStreamController.close();
    _formChangesSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _globalUnfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About you:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (_) {
                            _formChangesStreamController.add(true);
                          },
                          controller: _nameController,
                          validator: _nameValidator,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your name',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => _selectDate(context),
                              child: const Text('Select date of birth'),
                            ),
                            const SizedBox(width: 16),
                            Text(_dateOfBirth),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'You interested in:',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Gender',
                            label: Text('Gender'),
                          ),
                          validator: _genderValidator,
                          items: _getGenderListItems(),
                          onChanged: _onGenderDropdownChanged,
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField(
                          menuMaxHeight: 300,
                          validator: _nationalityValidator,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nationality',
                          ),
                          items: _getNationalityListItems(),
                          onChanged: _onNationalityDropdownChanged,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _onNext(context),
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Function()? _onNext(context) {
    AppUser user;
    if (_isFormValid) {
      user = AppUser(
        name: _nameController.text.trim(),
        birthDate: _selectedDate,
      );

      return () => widget.onNext(
            user: user,
            gender: _selectedGender!,
            nationality: _selectedNationality!,
          );
    }
    return null;
  }

  void _onGenderDropdownChanged(Gender? value) {
    _selectedGender = value;
    _formChangesStreamController.add(true);
  }

  void _onNationalityDropdownChanged(Country? value) {
    _selectedNationality = value;
    _formChangesStreamController.add(true);
  }

  void _globalUnfocus() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _nationalityValidator(Country? value) {
    if (value == null) {
      return 'Please select nationality';
    }
    return null;
  }

  String? _genderValidator(Gender? value) {
    if (value == null) {
      return 'Please select gender';
    }
    return null;
  }
}
