
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const divider = Padding(
      padding: EdgeInsets.all(10),
      child: Expanded(
                child: Divider(
                  height: 5,
                  color: Color.fromARGB(90, 158, 158, 158),
                  thickness: 1,
                ),
              ),
    );
    String mensaje = 'Solo tú puedes ver la configuración. También puedes revisar la configuración de Maps, la Búsqueda o cualquier servicio de Google que uses con frecuencia. Google protege la privacidad y la seguridad de tus datos. ';

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Cuenta de google'),
        ),
        body:   Expanded(
          child: ListView(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Tile(title:'Tu cuenta está protegida',
                description: "La verificación de seguridad revisó tu cuenta y no encontró acciones recomendadas.",
                linkTitle: 'Ver detalles'),
                divider,
            
                const Tile(title: 'Verificación de privacidad',
                description: 'Elige la configuración de privacidad indicada para ti con esta guía paso a paso.',
                linkTitle: 'Realiza la verificación de privacidad',),
                divider,
                
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 10,
                          child: Text('Buscas otra información?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        ],
                  ),
                ),

                const ActionRow(titleIcon: Icons.search, title: 'Buscar en la Cuenta de Google'),
                const ActionRow(titleIcon: Icons.question_mark_rounded, title: 'Ver las opciones de ayuda'),
                const ActionRow(titleIcon: Icons.mode_comment_outlined, title: 'Enviar comentarios'), 
                divider,

                //Tile(description: mensaje,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                            ),
                            RichText(text: TextSpan(text: mensaje, style: const TextStyle(fontSize: 15, color: Colors.grey),
                            children: const [
                              TextSpan(text: 'Más información', style: TextStyle(color: Colors.blue),),
                              WidgetSpan(child: Icon(Icons.question_mark_sharp, size: 12, color: Colors.blue,),alignment:PlaceholderAlignment.middle)
                            ]
                            ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("", style: TextStyle(color: Colors.blue),),)
                          ],
                        ),
                        ),
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                FlutterLogo(size: 50,),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

class ActionRow extends StatelessWidget {
  final IconData titleIcon;
  final String title;
  final IconData actionIcon;

  const ActionRow({
    super.key,
    required this.titleIcon,
    required this.title,
    this.actionIcon = Icons.arrow_forward_ios,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.start ,
        children: [
          Expanded(
            flex: 1,
            child:Icon(titleIcon, color: Colors.grey, size: 30,),
            ),
            Expanded(flex: 8, child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(title,style: const TextStyle(fontSize: 15,), 
              ),
            ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Icon(actionIcon, color: Colors.grey, size: 20,),
              ),
              ),
            ],
      ),
    );
  }
}


class Tile extends StatelessWidget {
  final String title;
  final String description;
  final String linkTitle;

   const Tile({super.key, this.title='', this.description='', this.linkTitle=''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Text(description,style: const TextStyle(fontSize: 13, color: Colors.grey),),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(linkTitle, style: const TextStyle(color: Colors.blue),),)
              ],
            ),
            ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Column(
                  children: [
                    FlutterLogo(size: 70,),
                  ],
                ),
            ),
            ),
        ],
      ),
    );
  }
}


