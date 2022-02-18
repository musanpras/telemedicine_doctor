part of 'components.dart';

class ListPatientComponent extends StatelessWidget {
  final bool isIndex0;
  const ListPatientComponent({Key? key, this.isIndex0 = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //widget button
    Widget button() {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/list_patient');
        },
        child: Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isIndex0 ? CustomColor.mainColor : CustomColor.dark3Color,
          ),
          child: Center(
            child: Text(
              "Mulai",
              style: CustomStyle.profileTextButton.copyWith(
                  color: isIndex0
                      ? CustomColor.light4Color
                      : CustomColor.light1Color),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 146,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColor.light3Color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: CustomColor.dark3Color.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "name",
                style: CustomStyle.profileTextButton,
              ),
              Text(
                "no urut",
                style: CustomStyle.profileTextButton,
              )
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Text("Gender", style: CustomStyle.notifSubTitleText),
              Text("Umur", style: CustomStyle.notifSubTitleText),
            ],
          ),
          const SizedBox(height: 30),
          button(),
        ],
      ),
    );
  }
}
