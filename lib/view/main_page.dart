import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("FAVORİ FİLMLERİM",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.orange,
                  Colors.pink,
                  Colors.purple,          
            ])          
         ),        
     )
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          viewModel.openAddMoviePage(context);
        },
         backgroundColor:Colors.purple,
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color.fromARGB(255, 46, 45, 45),
            child: ListTile(
              title: Text(
                viewModel.movies[index].name,
                style: TextStyle(fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 20)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Tür: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100
                      ),),
                      Text(viewModel.movies[index].type,
                       style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Yönetmen: ',
                       style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100
                      ),),
                      Text(viewModel.movies[index].director,
                       style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
