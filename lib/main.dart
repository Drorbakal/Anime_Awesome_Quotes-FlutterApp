import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuotList(),
  ));
}

class QuotList extends StatefulWidget {
  @override
  State<QuotList> createState() => _QuotListState();
}

class _QuotListState extends State<QuotList> {
  List<Quote> quotes = [
    Quote(name : 'Naruto Uzumaki' , text : "when you give up your dreams and everything else they're gone."),
    Quote(name : 'Naruto Uzumaki' , text : "somebody told me i'm a failure i'll prove them wrong."),
    Quote(name : 'Son Goku' , text : "don't fear pain or suffering you must embrace it."),
    Quote(name : 'Koro-Sensei' , text : "The difference between a novice and a master is that a master has failed more times than a novice had tried."),
    Quote(name : 'Kurotsuchi Mayuri' , text : "I hate perfection. To be perfect is to be unable to improve any further."),
    Quote(name : 'Naruto Uzumaki' , text : "If you don’t like the hand that fate’s dealt you with, fight for a new one."),
    Quote(name : 'Erza Scarlet' , text : "Hurt me with the truth. But never comfort me with a lie."),
    Quote(name : 'Otonashi Yuzuru' , text : "Even if we forget the faces of our friends, we will never forget the bonds that were carved into our souls."),
    Quote(name : 'Milly Thompson' , text : "Every journey begins with a single step. We just have to have patience."),
    Quote(name : 'Inuyasha' , text : "You’ve got two legs and a heartbeat. What’s stopping you?"),
    Quote(name : 'Monkey D. Luffy' , text : "If you don’t take risks, you can’t create a future."),
    Quote(name : 'L Lawliet' , text : "Learn to treasure your life because unfortunately, it can be taken away from you anytime."),
    Quote(name : 'Grimsley' , text : "It’s more important to master the cards you’re holding than to complain about the ones your opponent was dealt."),
    Quote(name : 'Shintaro Midorima' , text : "Don’t give up, there’s no shame in falling down! The true shame is to not stand up again!"),
    Quote(name : 'Rin Matsuoka' , text : "No amount of talent trumps hard work."),
    Quote(name : 'Sora' , text : "Life is not a game of luck. If you wanna win, work hard."),
    Quote(name : 'Gildarts' , text : "Fear is not evil. It tells you what weakness is. And once you know your weakness, you can become stronger as well as kinder."),
    Quote(name : 'Vash The Stampede' , text : "The ticket to the future is always open."),
  ];

  var removedQuotes = <Quote>[];

  void restoreDeletedQuotes() {
    setState(() {
      quotes.addAll(removedQuotes);
      removedQuotes.clear();
    });
  }

  bool isViewAllMode = false;

  final List<String> avatarImagePaths = [
    'assets/erzascarlet.jpg',
        'assets/gildarts.jpg',
        'assets/goku.jpeg',
        'assets/grimsley.jpg',
        'assets/inuyasha.jpg',
        'assets/korosensei.jpeg',
        'assets/kurotsuchimayuri.jpg',
        'assets/llawliet.jpg',
        'assets/millythompson.jpg',
        'assets/monkeydluffi.jpeg',
        'assets/naruto.jpg',
        'assets/otonashiyuzuru.jpg',
        'assets/rinmatsuoka.jpeg',
        'assets/shintaromidorima.jpg',
        'assets/sora.png',
        'assets/vashthestampede.png'
  ];

  PageController _pageController = PageController();
  int currentPageIndex = 0;

  TextEditingController searchController = TextEditingController();

  String convertToLowerCase(String input) {
    List<String> words = input.split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] = words[i].toLowerCase();
    }
    return words.join(' ');
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Quotes'),
          content: TextField(
            controller: searchController,
            decoration: InputDecoration(labelText: 'Search by Character Name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Search'),
              onPressed: () {
                String query = searchController.text.toLowerCase();
                List<Quote> filteredQuotes = quotes
                    .where((quote) =>
                    (quote.name?.toLowerCase() ?? '').contains(query))
                    .toList();
                setState(() {
                  quotes = filteredQuotes;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showQuoteDetailsDialog(Quote quote) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              if (quote.name == 'Erza Scarlet')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[0]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Erza Scarlet\nSeries: Fairy Tail',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Gildarts')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[1]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Gildarts\nSeries: Fairy Tail',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Son Goku')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[2]),
                      radius: 50,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Son Goku\nSeries: DragonBall Z',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Grimsley')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[3]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Grimsley\nSeries: Pokémon',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Inuyasha')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[4]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Inuyasha\nSeries: Inuyasha',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Koro-Sensei')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[5]),
                      radius: 40,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Koro-Sensei\nSeries: \nAssassination\nClassroom',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Kurotsuchi Mayuri')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[6]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Kurotsuchi Mayuri\nSeries: Bleach',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'L Lawliet')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[7]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'L Lawliet\nSeries: Deat Noth',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Milly Thompson')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[8]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Milly Thompson\nSeries: Trigun',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Monkey D. Luffy')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[9]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Monkey D. Luffy\nSeries: One Piece',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Naruto Uzumaki')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[10]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Naruto Uzumaki\nSeries: Naruto',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Otonashi Yuzuru')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[11]),
                      radius: 40,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Otonashi Yuzuru\nSeries: Angel Beats',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Rin Matsuoka')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[12]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Rin Matsuoka\nSeries: Free!',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Shintaro Midorima')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[13]),
                      radius: 40,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Shintaro Midorima\nSeries: Kuroko \nno Basuke',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Sora')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[14]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Sora\nSeries: No Game \nNo Life',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (quote.name == 'Vash The Stampede')
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatarImagePaths[15]),
                      radius: 60,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Vash \nThe Stampede\nSeries: Trigun',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Anime Awesome Quotes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[500],
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _showSearchDialog();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isViewAllMode = !isViewAllMode;
              });
            },
            child: Text(
              'View All',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        itemCount: (quotes.length / 4).ceil(),
        itemBuilder: (context, pageIndex) {
          return ListView(
            children: isViewAllMode
                ? quotes.map((quote) => GestureDetector(
              onTap: () => _showQuoteDetailsDialog(quote),
              child: QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                    removedQuotes.add(quote);
                  });
                },
              ),
            )).toList()
                : quotes
                .skip(pageIndex * 4)
                .take(4)
                .map((quote) => GestureDetector(
              onTap: () => _showQuoteDetailsDialog(quote),
              child: QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                    removedQuotes.add(quote);
                  });
                },
              ),
            ))
                .toList(),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton.icon(
          onPressed: () {
            restoreDeletedQuotes();
          },
          icon: Icon(
            Icons.restore_from_trash,
            color: Colors.blue,
          ),
          label: Text(
            'Restore Deleted Quotes',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
