১. একদম সাধারণ বাটন (Basic Structure)

একটি ElevatedButton-এর দুটি আবশ্যিক অংশ থাকে: onPressed (কি কাজ করবে) এবং child (ভিতরে কী দেখাবে)।
Dart

ElevatedButton(
  onPressed: () {
    print("Button Pressed!");
  },
  child: const Text("Click Me"),
)

২. বাটনে স্টাইল যোগ করা (Styling)

বাটনের রং, আকার বা বর্ডার পরিবর্তন করতে styleFrom মেথড ব্যবহার করা হয়।
Dart

ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // বাটনের ব্যাকগ্রাউন্ড রং
    foregroundColor: Colors.white, // টেক্সট বা আইকনের রং
    shadowColor: Colors.black,    // ছায়ার রং
    elevation: 10,                 // কতটুকু উঁচু দেখাবে
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // প্যাডিং
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // কোনা গোল করা
    ),
  ),
  onPressed: () {},
  child: const Text("Styled Button"),
)

৩. আইকন সহ বাটন (Icon Button)

যদি বাটনের ভেতর টেক্সটের সাথে আইকন দিতে চান, তবে .icon কনস্ট্রাক্টর ব্যবহার করতে হয়।
Dart

ElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.download),
  label: const Text("Download"),
)

৪. বাটন ডিসেবল (Disable) করা

যদি আপনি onPressed-এ কোনো ফাংশন না দিয়ে null লিখে দেন, তবে বাটনটি ডিসেবল হয়ে যাবে এবং এর রং ধূসর (Grey) হয়ে যাবে।
Dart

ElevatedButton(
  onPressed: null, // বাটনটি কাজ করবে না
  child: const Text("I am Disabled"),
)

৫. প্রপার্টি টেবিল (Quick Reference)
প্রপার্টি	কাজ
onPressed	বাটনে ক্লিক করলে কী হবে (Function)।
onLongPress	চেপে ধরে রাখলে কী হবে।
backgroundColor	বাটনের মূল রং পরিবর্তন।
minimumSize	বাটনের সর্বনিম্ন সাইজ নির্ধারণ।
side	বাটনের চারপাশে বর্ডার বা আউটলাইন দেওয়া।
৬. একটি সম্পূর্ণ উদাহরণ (Copy-Paste Code)

নিচের কোডটি দিয়ে একটি সুন্দর কাস্টম বাটন তৈরি করা হয়েছে:
Dart

ElevatedButton(
  onPressed: () {
    // আপনার লজিক এখানে লিখুন
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(20),
    fixedSize: const Size(200, 60),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    elevation: 5,
  ),
  child: const Text("Explore More"),
)

অবশ্যই! minimumSize এবং side প্রপার্টি দুটি ব্যবহার করা হয় বাটনের সাইজ ফিক্সড করা এবং বাটনের চারপাশে বর্ডার দেওয়ার জন্য। এগুলো ElevatedButton.styleFrom-এর ভেতরে লিখতে হয়।

নিচে সহজ উদাহরণ দিয়ে বুঝিয়ে দিচ্ছি:
১. minimumSize এর ব্যবহার

এটি ব্যবহার করা হয় বাটনের একটি নির্দিষ্ট দৈর্ঘ্য (Width) এবং উচ্চতা (Height) দেওয়ার জন্য।
Dart

ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(200, 50), // (Width, Height)
  ),
  onPressed: () {},
  child: const Text("Fixed Size Button"),
)

    টিপ: আপনি যদি চান বাটনটি স্ক্রিনের পুরো চওড়া হবে, তবে Size(double.infinity, 50) ব্যবহার করতে পারেন।

২. side এর ব্যবহার

বাটনের চারপাশে বর্ডার বা আউটলাইন দেওয়ার জন্য এটি ব্যবহার করা হয়। এতে বর্ডারের রং এবং মোটা (Width) কতটুকু হবে তা বলে দেওয়া যায়।
Dart

ElevatedButton(
  style: ElevatedButton.styleFrom(
    side: const BorderSide(
      color: Colors.red, // বর্ডারের রং
      width: 2,          // বর্ডারের পুরুত্ব
    ),
  ),
  onPressed: () {},
  child: const Text("Border Button"),
)

৩. দুটি একসাথে ব্যবহার করলে কেমন দেখাবে?

নিচের কোডটি কপি করে টেস্ট করে দেখতে পারেন:
Dart

ElevatedButton(
  style: ElevatedButton.styleFrom(
    // সাইজ সেট করা
    minimumSize: const Size(250, 60), 
    
    // বর্ডার সেট করা
    side: const BorderSide(
      color: Colors.deepPurple, 
      width: 3,
    ),
    
    // কোনা গোল করা (ঐচ্ছিক)
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    
    backgroundColor: Colors.white, // ব্যাকগ্রাউন্ড সাদা
    foregroundColor: Colors.deepPurple, // টেক্সট পার্পল
  ),
  onPressed: () {},
  child: const Text(
    "Custom Styled Button",
    style: TextStyle(fontSize: 18),
  ),
)

সংক্ষেপে মনে রাখুন:

    minimumSize: বাটনের মাপ ঠিক করার জন্য (Size object নেয়)।

    side: বাটনের বর্ডার দেওয়ার জন্য (BorderSide object নেয়)।

    lutter-এ side প্রপার্টি মূলত BorderSide ক্লাস ব্যবহার করে কাজ করে। একটি বাটনের চারপাশের বর্ডার বা লাইনকে কাস্টমাইজ করার জন্য এতে কয়েকটি গুরুত্বপূর্ণ প্রপার্টি আছে।

নিচে BorderSide-এর প্রধান প্রপার্টিগুলো দেওয়া হলো:
১. প্রধান প্রপার্টিসমূহ (Core Properties)
প্রপার্টি	কাজ (Description)	উদাহরণ
color	বর্ডারের রং পরিবর্তন করে।	color: Colors.red
width	বর্ডারটি কতটুকু মোটা হবে তা ঠিক করে।	width: 2.0
style	বর্ডারটি থাকবে কি থাকবে না তা ঠিক করে।	BorderStyle.solid অথবা none
strokeAlign	বর্ডারটি কি ইনসাইড, আউটসাইড নাকি সেন্টারে হবে।	BorderSide.strokeAlignCenter
২. প্রাক্টিক্যাল উদাহরণ (Code Example)

নিচে একটি বাটনে side-এর সব প্রপার্টি ব্যবহার করে দেখানো হলো:
Dart

ElevatedButton(
  style: ElevatedButton.styleFrom(
    side: const BorderSide(
      color: Colors.blueAccent, // ১. বর্ডারের রঙ
      width: 3.0,               // ২. বর্ডারের পুরুত্ব
      style: BorderStyle.solid,  // ৩. বর্ডারটি দৃশ্যমান (Solid) থাকবে
      strokeAlign: BorderSide.strokeAlignCenter, // ৪. বর্ডারের অবস্থান
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // কোনা একটু গোল করা
    ),
  ),
  onPressed: () {},
  child: const Text("Border Properties Demo"),
)

৩. কিছু গুরুত্বপূর্ণ বিষয় মনে রাখুন:

    color: ডিফল্টভাবে এটি কালো থাকে। আপনি যেকোনো Color ব্যবহার করতে পারেন।

    width: আপনি যদি ১-এর কম (যেমন: 0.5) দেন, তবে বর্ডারটি খুব চিকন দেখাবে। আবার বড় সংখ্যা দিলে অনেক মোটা হবে।

    style:

        BorderStyle.solid: এটি সাধারণ দৃশ্যমান বর্ডার।

        BorderStyle.none: বর্ডারটি অদৃশ্য করে দেয় (যদিও জায়গা দখল করে রাখে)।

    strokeAlign:

        BorderSide.strokeAlignInside: বর্ডার বাটনের ভেতরে থাকবে।

        BorderSide.strokeAlignCenter: বর্ডার লাইনের মাঝখানে থাকবে।

        BorderSide.strokeAlignOutside: বর্ডার বাটনের বাইরে চলে যাবে।

সহজ কথায়: আপনি যদি শুধু একটি লাল বর্ডার দিতে চান, তবে শুধু color এবং width ব্যবহার করলেই আপনার কাজ হয়ে যাবে।

ElevatedButton.styleFrom এর ভেতরে অনেকগুলো প্রপার্টি আছে যা দিয়ে আপনি একটি বাটনকে আপনার ইচ্ছামতো সাজাতে পারেন। নিচে সবথেকে প্রয়োজনীয় প্রপার্টিগুলো ক্যাটাগরি অনুযায়ী সাজিয়ে দেওয়া হলো:
১. রঙের প্রপার্টি (Color Properties)

    backgroundColor: বাটনের পেছনের মূল রং।

    foregroundColor: বাটনের টেক্সট এবং আইকনের রং।

    disabledBackgroundColor: বাটন যখন ডিসেবল থাকে (onPressed: null), তখন পেছনের রং কেমন হবে।

    disabledForegroundColor: ডিসেবল অবস্থায় টেক্সট বা আইকনের রং।

    shadowColor: বাটনের নিচে যে ছায়া পড়ে, তার রং।

    surfaceTintColor: Material 3 তে বাটনের উপরের লেয়ারের হালকা রঙের আভা (Tint)।

২. আকার ও আয়তন (Shape & Size)

    minimumSize: বাটনের সর্বনিম্ন দৈর্ঘ্য ও প্রস্থ (যেমন: Size(150, 50))।

    maximumSize: বাটনের সর্বোচ্চ কত বড় হতে পারবে।

    fixedSize: বাটনটি সবসময় একটি নির্দিষ্ট সাইজেই থাকবে।

    padding: বাটনের বর্ডার এবং ভেতরের টেক্সটের মাঝখানের দূরত্ব (যেমন: EdgeInsets.all(20))।

৩. বর্ডার ও শেপ (Border & Shape)

    side: বাটনের চারপাশে বর্ডার দেওয়ার জন্য (যেমন: BorderSide(color: Colors.black))।

    shape: বাটনের আকৃতি কেমন হবে (গোল, চারকোনা, বা রাউন্ডেড)। যেমন:

        RoundedRectangleBorder (কোণা গোল করা)।

        CircleBorder (পুরো গোল বাটন)।

        StadiumBorder (ক্যাপসুল আকৃতির বাটন)।

৪. টেক্সট ও ইফেক্ট (Text & Effects)

    textStyle: টেক্সটের ফন্ট সাইজ, বোল্ডনেস ইত্যাদি সেট করার জন্য (যেমন: TextStyle(fontSize: 20))।

    elevation: বাটনটি স্ক্রিন থেকে কতটা উপরে (উঁচু) দেখাবে এবং ছায়া কতটা গভীর হবে।

    alignment: বাটনের ভেতরের কনটেন্ট (টেক্সট/আইকন) কোন দিকে থাকবে (Center, Left, Right)।

৫. অ্যানিমেশন ও ফিডব্যাক (Feedback)

    animationDuration: বাটনের রঙ বা শ্যাডো পরিবর্তনের সময় কতক্ষণ লাগবে।

    enabledMouseCursor: কম্পিউটারে মাউস বাটনের ওপর নিলে কার্সর কেমন দেখাবে।

একটি সব-সহ উদাহরণ (Master Example):
Dart

ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,         // ব্যাকগ্রাউন্ড
    foregroundColor: Colors.white,        // টেক্সট কালার
    elevation: 8,                         // ছায়ার গভীরতা
    shadowColor: Colors.tealAccent,       // ছায়ার রং
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    minimumSize: const Size(200, 60),     // সাইজ
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // রাউন্ড শেপ
    ),
    side: const BorderSide(color: Colors.black, width: 2), // বর্ডার
  ),
  onPressed: () {},
  child: const Text("Master Button"),
)

পরবর্তী ধাপ:

হজ কথায় বলতে গেলে, EdgeInsets.symmetric মানে হলো আপনি বাটনের ভেতরে সমানভাবে (Symmetrically) ফাঁকা জায়গা বা দূরত্ব (Padding) তৈরি করছেন।

এখানে horizontal এবং vertical এর কাজ নিচে ভেঙে বুঝিয়ে দিচ্ছি:
১. horizontal: 50 (ডানে ও বামে)

এটি বাটনের ভেতরের টেক্সট বা আইকন থেকে বাম পাশে ৫০ এবং ডান পাশে ৫০ পিক্সেল জায়গা খালি রাখবে। অর্থাৎ, বাটনটি দুই পাশে চওড়া হবে।
২. vertical: 20 (উপরে ও নিচে)

এটি বাটনের ভেতরের টেক্সট থেকে উপরে ২০ এবং নিচে ২০ পিক্সেল জায়গা খালি রাখবে। অর্থাৎ, বাটনটি লম্বায় বড় হবে।
ভিজ্যুয়াল উদাহরণ (Visual Idea):

কল্পনা করুন আপনার বাটনের টেক্সট হলো "Login":

    Vertical (২০): লেখার উপর আর নিচে ২০ পিক্সেল গ্যাপ।

    Horizontal (৫০): লেখার ডানে আর বামে ৫০ পিক্সেল গ্যাপ।

Dart

padding: const EdgeInsets.symmetric(
  horizontal: 50, // ডানে-বামে দূরত্ব
  vertical: 20,   // উপরে-নিচে দূরত্ব
),

কেন এটি ব্যবহার করবেন?

আপনি যদি শুধু EdgeInsets.all(20) ব্যবহার করেন, তবে ডানে-বামে-উপরে-নিচে সবদিকেই ২০ পিক্সেল জায়গা সমানভাবে থাকবে। কিন্তু সাধারণত আমাদের বাটনগুলো লম্বার চেয়ে চওড়ায় বেশি বড় করার প্রয়োজন হয়, তাই symmetric ব্যবহার করে আমরা ডানে-বামে বেশি জায়গা (যেমন ৫০) এবং উপরে-নিচে কম জায়গা (যেমন ২০) দিতে পারি।
আরও ৩টি ছোট টিপস:

১. EdgeInsets.all(10): সব দিকে সমান ১০ পিক্সেল।
২. EdgeInsets.only(left: 10, top: 5): শুধু নির্দিষ্ট কোনো এক বা একাধিক দিকে (যেমন শুধু বামে বা শুধু উপরে)।
৩. EdgeInsets.fromLTRB(10, 20, 10, 20): চারদিকে আলাদা আলাদা মান (Left, Top, Right, Bottom)।

OutlinedButton হলো Flutter-এর আরেকটি জনপ্রিয় বাটন, যা দেখতে অনেকটা হালকা এবং স্টাইলিশ। এর কোনো ডিফল্ট ব্যাকগ্রাউন্ড কালার থাকে না, শুধু চারদিকে একটি বর্ডার (Outline) থাকে।

নিচে OutlinedButton এর শুরু থেকে শেষ পর্যন্ত (A to Z) বিস্তারিত আলোচনা করা হলো:
১. সাধারণ গঠন (Basic Structure)

এটি ব্যবহার করা একদম সহজ। ElevatedButton-এর মতোই এর onPressed এবং child থাকে।
Dart

OutlinedButton(
  onPressed: () {
    print("Outlined Button Clicked!");
  },
  child: const Text("Click Me"),
)

২. স্টাইল যোগ করা (styleFrom)

এটির বর্ডার, টেক্সটের রং এবং আকার পরিবর্তন করতে styleFrom ব্যবহার করা হয়।
Dart

OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.deepPurple, // টেক্সট এবং আইকনের রং
    side: const BorderSide(
      color: Colors.deepPurple, // বর্ডারের রং
      width: 2,                 // বর্ডার কতটুকু মোটা হবে
    ),
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // কোনা গোল করা
    ),
  ),
  onPressed: () {},
  child: const Text("Styled Outlined Button"),
)

৩. আইকন সহ বাটন (Icon Button)

অন্যান্য বাটনের মতো এটিতেও আইকন ব্যবহার করা যায়।
Dart

OutlinedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.add_shopping_cart),
  label: const Text("Add to Cart"),
)

৪. ব্যাকগ্রাউন্ড কালার দেওয়া (Hover Effect)

যদিও OutlinedButton-এ সাধারণত ব্যাকগ্রাউন্ড থাকে না, কিন্তু আপনি চাইলে হালকা কোনো রং (যেমন বাটনে মাউস নিলে বা ক্লিক করলে) দিতে পারেন।
Dart

OutlinedButton(
  style: OutlinedButton.styleFrom(
    backgroundColor: Colors.blue.withOpacity(0.1), // হালকা ব্যাকগ্রাউন্ড
  ),
  onPressed: () {},
  child: const Text("Light BG Button"),
)

৫. ElevatedButton বনাম OutlinedButton (পার্থক্য)
ফিচার	ElevatedButton	OutlinedButton
লুক (Look)	উঁচু এবং ভরাট (Filled)	শুধু বর্ডার, ভেতরটা খালি
শ্যাডো (Shadow)	থাকে (Elevation)	থাকে না (সাধারণত)
ব্যবহার	প্রধান কাজের জন্য (যেমন: Submit, Save)	গৌণ বা বিকল্প কাজের জন্য (যেমন: Cancel, Back)
৬. একটি চমৎকার উদাহরণ (Complete Example)

নিচে একটি বাটন দেওয়া হলো যা দেখতে খুব মডার্ন:
Dart

OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.redAccent,
    side: const BorderSide(color: Colors.redAccent, width: 1.5),
    minimumSize: const Size(200, 55),
    shape: const StadiumBorder(), // এটি বাটনকে ক্যাপসুল আকৃতির করে দেয়
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  ),
  onPressed: () {},
  child: const Text("Delete Account"),
)

প্রো টিপ: আপনি কি জানেন StadiumBorder() দিলে বাটনের কোনাগুলো অটোমেটিক একদম গোল (ক্যাপসুলের মতো) হয়ে যায়? এতে আলাদা করে BorderRadius দিতে হয় না।

TextButton হলো Flutter-এর সবচেয়ে সিম্পল বাটন। এতে কোনো ব্যাকগ্রাউন্ড কালার বা বর্ডার থাকে না—এটি দেখতে অনেকটা সাধারণ টেক্সটের মতো, কিন্তু ক্লিক করলে এটি রেসপন্স করে।

সাধারণত Cancel, Forgot Password, অথবা কোনো Link দেখানোর জন্য এটি ব্যবহার করা হয়।
১. সাধারণ টেক্সট বাটন (Basic Structure)

এটি তৈরি করা খুবই সহজ:
Dart

TextButton(
  onPressed: () {
    print("TextButton Clicked!");
  },
  child: const Text("Forgot Password?"),
)

২. স্টাইল যোগ করা (styleFrom)

যদিও এর ডিফল্ট কোনো বর্ডার নেই, তবুও আপনি এর টেক্সটের রং, প্যাডিং বা ক্লিক করার সময়কার ইফেক্ট পরিবর্তন করতে পারেন।
Dart

TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.blue, // টেক্সটের রং
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline, // টেক্সটের নিচে দাগ দেওয়া
    ),
    padding: const EdgeInsets.all(15), // চারদিকে ফাঁকা জায়গা
  ),
  onPressed: () {},
  child: const Text("Click Here"),
)

৩. আইকন সহ টেক্সট বাটন (Icon Button)

অন্যান্য বাটনের মতো এটিতেও আইকন যোগ করা যায়:
Dart

TextButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.info_outline, size: 20),
  label: const Text("Learn More"),
)

৪. তিন ধরণের বাটনের পার্থক্য (এক নজরে)
বাটন টাইপ	দেখতে কেমন	কখন ব্যবহার করবেন
ElevatedButton	ভরাট এবং উঁচু (Shadow)	প্রধান কাজের জন্য (যেমন: Login, Submit)
OutlinedButton	শুধু বর্ডার আছে	দ্বিতীয় সারির কাজের জন্য (যেমন: Register, Back)
TextButton	শুধু টেক্সট (Clean)	লিঙ্কের মতো কাজের জন্য (যেমন: Skip, Edit)
৫. একটি প্রো-লেভেল উদাহরণ (Clean Design)

নিচে একটি সুন্দর টেক্সট বাটন দেওয়া হলো যা দেখতে খুব মডার্ন:
Dart

TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Text("Next"),
      SizedBox(width: 5),
      Icon(Icons.arrow_forward, size: 16),
    ],
  ),
)

মজার ব্যাপার: আপনি কি জানেন InkWell বা GestureDetector ব্যবহার করে যেকোনো উইজেটকেই (যেমন: Image বা Container) বাটনের মতো বানানো যায়?

অবশ্যই! যখন আপনার একটি Container, Image বা নিজের তৈরি করা কোনো ডিজাইনকে বাটনের মতো কাজ করাতে হয়, তখন আপনি InkWell অথবা GestureDetector ব্যবহার করতে পারেন।

নিচে দুটির পার্থক্য এবং ব্যবহার সহজভাবে দেওয়া হলো:
১. InkWell (Ripple Effect সহ)

এটি ব্যবহার করলে বাটনে ক্লিক করার সময় একটি সুন্দর ঢেউয়ের মতো ইফেক্ট (Ripple Effect) দেখা যায়, যা আমরা সাধারণত গুগল বা অ্যান্ড্রয়েড অ্যাপে দেখি।
Dart

InkWell(
  onTap: () {
    print("Container clicked with ripple effect!");
  },
  borderRadius: BorderRadius.circular(15), // রিপল ইফেক্টটি গোল করার জন্য
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Text(
      "Custom InkWell Button",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ),
)

২. GestureDetector (সব ধরণের টাচ কন্ট্রোল)

এতে কোনো রিভল ইফেক্ট থাকে না, কিন্তু এটি অনেক শক্তিশালী। এটি দিয়ে আপনি Double Tap, Long Press, এমনকি Drag বা টানার কাজও করতে পারেন।
Dart

GestureDetector(
  onTap: () {
    print("Single Tap!");
  },
  onDoubleTap: () {
    print("Double Tap logic here!");
  },
  onLongPress: () {
    print("Long Press logic here!");
  },
  child: Container(
    width: 200,
    height: 100,
    color: Colors.blueGrey,
    alignment: Alignment.center,
    child: const Text(
      "Gesture Detector",
      style: TextStyle(color: Colors.white),
    ),
  ),
)

৩. পার্থক্য কী? (এক নজরে)
ফিচারা	InkWell	GestureDetector
Visual Effect	ক্লিক করলে Ripple/ঢেউ দেখা যায়।	কোনো দৃশ্যমান ইফেক্ট নেই।
ব্যবহার	সাধারণ বাটনের মতো ব্যবহারের জন্য সেরা।	জটিল টাচ (Double tap, Drag) এর জন্য।
প্যারেন্ট	এটি সাধারণত Material উইজেটের ভেতরে ভালো কাজ করে।	যেকোনো জায়গায় সরাসরি কাজ করে।
প্রো টিপ:

আপনি যদি চান আপনার পুরো অ্যাপের ব্যাকগ্রাউন্ডে একটি ইমেজ থাকবে এবং সেই ইমেজে ক্লিক করলে কাজ হবে, তখন GestureDetector ইমেজের ওপর র‍্যাপ (Wrap) করে দিলেই কাজ করবে!

Flutter-এ SizedBox হলো একটি অত্যন্ত প্রয়োজনীয় এবং সহজ উইজেট। এটি মূলত একটি নির্দিষ্ট মাপের "খালি বক্স" হিসেবে কাজ করে। নিচে এর A to Z ব্যবহার এবং কেন এটি ব্যবহার করবেন তা বুঝিয়ে দিচ্ছি:
১. কেন SizedBox ব্যবহার করবেন? (Why Use It?)

সাধারণত দুই বা ততোধিক উইজেটের মাঝে ফাঁকা জায়গা তৈরি করতে বা কোনো উইজেটকে নির্দিষ্ট সাইজ দিতে আমরা এটি ব্যবহার করি।

    সহজ (Simplicity): এটি Container-এর চেয়ে অনেক হালকা (Lightweight), কারণ এতে ডেকোরেশন বা কালারের মতো জটিল প্রপার্টি নেই।

    নির্দিষ্ট মাপ (Fixed Size): কোনো উইজেটকে (যেমন বাটন) জোড় করে একটি নির্দিষ্ট উইডথ বা হাইট দিতে এটি সেরা।

    পারফরম্যান্স: এটি মেমরি কম খরচ করে, তাই অ্যাপ ফাস্ট থাকে।

২. প্রধান ব্যবহারসমূহ (Core Uses)
ক. দুই উইজেটের মাঝে গ্যাপ দেওয়া (Spaced Items)

এটি সবথেকে বেশি ব্যবহৃত হয়। Column বা Row-এর ভেতর উইজেটগুলোর মাঝে দূরত্ব তৈরি করতে:
Dart

Column(
  children: [
    const Text("প্রথম লাইন"),
    const SizedBox(height: 20), // নিচে ২০ পিক্সেল ফাঁকা জায়গা দেবে
    const Text("দ্বিতীয় লাইন"),
    
    Row(
      children: [
        const Icon(Icons.star),
        const SizedBox(width: 10), // ডানে ১০ পিক্সেল ফাঁকা জায়গা দেবে
        const Text("Rating"),
      ],
    ),
  ],
)

খ. নির্দিষ্ট সাইজের বাটন বা উইজেট তৈরি (Fixed Dimensions)

কোনো উইজেটের সাইজ নিয়ন্ত্রণ করতে সেটিকে SizedBox দিয়ে মুড়িয়ে (Wrap) দিন:
Dart

SizedBox(
  width: double.infinity, // স্ক্রিনের পুরো চওয়ড়া হবে
  height: 60,            // উচ্চতা ফিক্সড ৬০ হবে
  child: ElevatedButton(
    onPressed: () {},
    child: const Text("Full Width Button"),
  ),
)

গ. খালি উইজেট হিসেবে (Invisible Placeholder)

কখনো কখনো আমাদের এমন দরকার হয় যে, শর্ত সাপেক্ষে (Condition) কিছু দেখাব অথবা দেখাব না। সেক্ষেত্রে খালি SizedBox ব্যবহার করা হয়:
Dart

child: isDataLoaded ? const Text("Data Ready") : const SizedBox(), 
// ডাটা না থাকলে স্ক্রিনে কিছুই দেখাবে না, জায়গা দখল করবে না।

৩. বিশেষ কনস্ট্রাক্টর (Special Constructors)

Flutter-এ SizedBox-এর দুটি দারুণ শর্টকাট আছে:

    SizedBox.expand(): এটি তার প্যারেন্ট উইজেটের যতটুকু জায়গা আছে সবটুকু দখল করে নেয়।

    SizedBox.shrink(): এটি একদম ০ পিক্সেল জায়গা নেয় (খুবই ছোট)।

    SizedBox.square(): যদি দৈর্ঘ্য এবং প্রস্থ সমান রাখতে চান (যেমন: SizedBox.square(dimension: 100))।

৪. Container বনাম SizedBox (পার্থক্য)
ফিচার	SizedBox	Container
কাজ	শুধু নির্দিষ্ট মাপ দেওয়া।	মাপ + ডিজাইন (Color, Border, Shadow)।
পারফরম্যান্স	অনেক ফাস্ট এবং হালকা।	কিছুটা ভারী।
কনস্ট্যান্ট	const হিসেবে ব্যবহার করা যায়।	const হিসেবে ব্যবহার করা যায় না।
৫. একটি সম্পূর্ণ উদাহরণ (Practical Demo)
Dart

SizedBox(
  width: 250,
  height: 150,
  child: Card(
    color: Colors.amber,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("SizedBox Card"),
          SizedBox(height: 10), // টেক্সট দুটির মাঝে গ্যাপ
          Text("Fixed Size!"),
        ],
      ),
    ),
  ),
)

প্রো টিপ: যখনই আপনার শুধু ফাঁকা জায়গা (Gap) দরকার হবে, চোখ বন্ধ করে SizedBox ব্যবহার করবেন। আর যদি সেই জায়গায় কালার বা বর্ডার দিতে হয়, তখন Container ব্যবহার করবেন।

IconButton ব্যবহার করা খুবই সহজ। এটি মূলত এমন একটি বাটন যেখানে কোনো টেক্সট থাকে না, শুধু একটি আইকন থাকে। এটি সাধারণত অ্যাপবার (AppBar), সেটিংস বা কোনো কিছুর অ্যাকশন বাটন হিসেবে ব্যবহৃত হয়।

নিচে এর ব্যবহার এবং খুঁটিনাটি দেওয়া হলো:
১. সাধারণ গঠন (Basic Structure)

একটি IconButton-এ দুটি জিনিস অবশ্যই দিতে হয়: icon (কোন আইকনটি দেখাবে) এবং onPressed (ক্লিক করলে কী হবে)।
Dart

IconButton(
  icon: const Icon(Icons.favorite),
  onPressed: () {
    print("Favorite clicked!");
  },
)

২. কালার এবং সাইজ পরিবর্তন

আপনি সহজেই আইকনের রং এবং এর আকার ছোট-বড় করতে পারেন।
Dart

IconButton(
  iconSize: 40,             // আইকনের সাইজ
  color: Colors.red,        // আইকনের রং
  onPressed: () {},
  icon: const Icon(Icons.favorite),
)

৩. টুলটিপ (Tooltip) যোগ করা

এটি একটি দারুণ ফিচার! ব্যবহারকারী যখন বাটনের ওপর আঙুল দিয়ে চেপে ধরে রাখে (Long Press), তখন একটি ছোট লেখা ভেসে ওঠে যা বাটনটির কাজ বুঝিয়ে দেয়।
Dart

IconButton(
  icon: const Icon(Icons.search),
  tooltip: 'Search here',   // চেপে ধরলে এই লেখাটি দেখাবে
  onPressed: () {},
)

৪. স্প্ল্যাশ এবং হাইলাইট কালার (Styling)

বাটনে ক্লিক করলে যে গোল ইফেক্ট (Splash) দেখা যায়, তার রংও আপনি পরিবর্তন করতে পারেন।
Dart

IconButton(
  icon: const Icon(Icons.notifications),
  splashColor: Colors.yellow,    // ক্লিক করার মুহূর্তের রং
  highlightColor: Colors.green,  // চেপে ধরে রাখলে যে রং দেখাবে
  onPressed: () {},
)

৫. কখন কোনটি ব্যবহার করবেন?
ফিচারা	IconButton	TextButton / ElevatedButton
জায়গা	খুব কম জায়গা নেয়।	টেক্সট থাকার কারণে বেশি জায়গা নেয়।
ব্যবহার	ব্যাক বাটন, ডিলিট, সেটিংস আইকন।	লগইন, সাইনআপ, সাবমিট ফরম।
লুক	ক্লিন এবং মডার্ন।	একটু বেশি ফরমাল।
৬. একটি সুন্দর উদাহরণ (AppBar-এ ব্যবহার)
Dart

AppBar(
  title: const Text("My App"),
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
)

প্রো টিপ: আপনি যদি আইকনের চারপাশে একটি ব্যাকগ্রাউন্ড গোল কালার দিতে চান (যেমন একটি বৃত্তের ভেতর আইকন), তবে আপনি IconButton-কে একটি CircleAvatar অথবা Container এর ভেতর নিয়ে ডিজাইন করতে পারেন।

আপনি কি এখন সব ধরণের বাটন ব্যবহার করে একটি "Login Page" এর ডিজাইন করা দেখতে চান? যেখানে সব ধরণের বাটনের ব্যবহার থাকবে। আমি কি কোডটি করে দেব?
