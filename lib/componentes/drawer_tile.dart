import 'package:caju/modelos/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Drawertile extends StatelessWidget {
  const Drawertile({super.key,required this.pagina, required this.iconData, required this.title});

  final dynamic iconData;
  final String title;
  final int pagina;

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().currentPage;

    return InkWell(
      onTap: (){
        context.read<PageManager>().setPage(pagina);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: 
                Icon(
                  iconData,
                  size: 32,
                  color: curPage == pagina ? const Color.fromARGB(255, 54, 134, 44) : Colors.black,
                ),
            ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: curPage == pagina ? const Color.fromARGB(255, 54, 134, 44) : Colors.black,
                  ),
                )
          ],
        ),
      ),
    );
  }
}