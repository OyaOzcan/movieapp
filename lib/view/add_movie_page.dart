import 'package:flutter/material.dart';
import 'package:movie/view/common/common_text_field.dart';
import 'package:movie/view_model/add_movie_view_model.dart';
import 'package:provider/provider.dart';

class AddMoviePage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _directorController = TextEditingController();

  AddMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Film Ekle",
        style: TextStyle(color :Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildNameTextField(),
                SizedBox(height: 16),
                _buildTypeTextField(),
                 SizedBox(height: 16),
                _buildDirectorTextField(),
              ],
            ),
            _buildAddMovieButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return CommonTextField(
      controller: _nameController,
      label: "Name",
    );
  }

  Widget _buildTypeTextField() {
    return CommonTextField(
      controller: _typeController,
      label: "Type",
    );
  }

  Widget _buildDirectorTextField() {
    return CommonTextField(
      controller: _directorController,
      label: "Director",
    );
  }

  Widget _buildAddMovieButton(BuildContext context) {
    AddMovieViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
      ),
      child: Text("Film Ekle",
      style: TextStyle(color :Colors.white),),
      onPressed: () {
        viewModel.addMovie(
          context,
          _nameController.text.trim(),
          _typeController.text.trim(),
          _directorController.text.trim(),
        );
      },
    );
  }

}
