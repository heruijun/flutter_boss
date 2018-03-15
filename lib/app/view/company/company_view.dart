import 'package:flutter/material.dart';
import 'package:flutter_app/app/item/companylistitem.dart';
import 'package:flutter_app/app/model/company.dart';
import 'package:flutter_app/app/view/company/company_detail.dart';

class CompanyTab extends StatefulWidget {
  @override
  CompanyList createState() => new CompanyList();
}

class CompanyList extends State<CompanyTab> {

  List<Company> _companties = [];

  @override
  void initState() {
    super.initState();
    getCompanyList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
            '公 司', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
//        actions: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.find_in_page, color: Colors.white,),
//            onPressed: () {
//              print('onclick');
//            },
//          )
//        ],
      ),
      body: new ListView.builder(
          itemCount: _companties.length, itemBuilder: buildCompanyItem),
    );
  }

  buildCompanyItem(BuildContext context, int index) {
    Company company = _companties[index];

    var companyItem = new GestureDetector(
        onTap: () => navCompanyDetail(company, index),
        child: new CompanyListItem(company)
    );

    return companyItem;
  }

  void getCompanyList() {
    setState(() {
      _companties = Company.fromJson("""
          {
            "list": [
               {
                "logo": "https://img.bosszhipin.com/beijin/mcs/chatphoto/20161230/b0df9f099f1d6db1937bc78068fb4c15760bb3f59f760cd45f5945e615392f6f.jpg",
                "name": "杭州蚂蚁金服信息技术有限公司",
                "location": "上海市浦东新区",
                "type": "互联网",
                "size": "B轮",
                "employee": "10000人以上",
                "hot": "资深开放产品技术工程师",
                "count": "500",
                "inc": "蚂蚁金融服务集团（以下称“蚂蚁金服”）起步于2004年成立的支付宝。2014年10月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来微小而美好的改变”为愿景，致力于打造开放的生态系统，通过“互联网推进器计划”助力金融机构和合作伙伴加速迈向“互联网+”，为小微企业和个人消费者提供普惠金融服务。蚂蚁金服集团旗下及相关业务包括生活服务平台支付宝、智慧理财平台蚂蚁聚宝、云计算服务平台蚂蚁金融云、独立第三方信用评价体系芝麻信用以及网商银行等。另外，蚂蚁金服也与投资控股的公司及关联公司一起，在业务和服务层面通力合作，深度整合共推商业生态系统的繁荣。"
              },
              {
                "logo": "https://img.bosszhipin.com/beijin/mcs/chatphoto/20170927/60158fe74a9233b55ee08206ca5df1dccfcd208495d565ef66e7dff9f98764da.jpg",
                "name": "百度",
                "location": "上海市浦东新区",
                "type": "互联网",
                "size": "已上市",
                "employee": "10000人以上",
                "hot": "Android架构师",
                "count": "300",
                "inc": "百度（纳斯达克：BIDU），全球最大的中文搜索引擎、最大的中文网站。1999年底,身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于 2000年1月1日在中关村创建了百度公司。“百度”二字,来自于八百年前南宋词人辛弃疾的一句词：众里寻他千百度。这句话描述了词人对理想的执着追求。"
              },
              {
                "logo": "https://img.bosszhipin.com/beijin/mcs/chatphoto/20170420/9e7ec542865511eb31273086b78598e355d0075cc85bc70bb61f658db0db4c2c.jpg",
                "name": "今日头条",
                "location": "北京朝阳区",
                "type": "互联网",
                "size": "D轮",
                "employee": "100-400人",
                "hot": "Android架构师",
                "count": "500",
                "inc": "【字节跳动】字节跳动成立于2012年3月，是一家技术驱动的移动互联网公司，公司致力于采用先进的推荐引擎技术，提供基于移动设备的信息分发解决方案。 【愿景】全球最懂你的信息平台，连接人与信息，促进创作和交流。【今日头条】“今日头条”是一款基于数据挖掘技术的个性化推荐引擎产品，它为用户推荐有价值的、个性化的信息，提供连接人与信息的新型服务，是国内移动互联网领域成长最快的产品之一。“今日头条”于2012年8月上线。【公司信息】who we are我们是开发了 《今日头条》&《内涵段子》等应用的团队,2012年成立发展最快的移动互联网公司之一，是一个拥有丰富创业经历和成熟公司经验的靠谱团队，聚集了来自一流学校和公司的顶尖人才，有着全球科技、金融行业最***的投资人投资。我们立志用卓越的技术帮助用户发现有价值的信息。我们高效、简单、极致、务实。我们每月有数千万的用户通过我们的产品了解世界、启发思考、开怀一笑，并活跃地参与互动。我们的技术团队：人均承担近200万日启动次数的访问勇于采用新锐的算法和构架，既大量使用优秀开源系统又自研核心业务系统既学习经典和优秀的实践，又敢于做出自己的方案每个人都可参加从用户沟通、需求讨论、产品开发、到上线部署的环节办公室可自由访问全球优秀网站，英文资源what we have1、 我们成长快速，前景广阔，能给优秀的你更大的舞台。发布每日千万用户使用的产品，每天获得大量用户反馈参与亿级访问次数的实时个性化系统构架的迭代业界牛人的培训交流2、 优厚的短期长期回报和大幅上升的空间。我们提供媲美名企的薪资，外加股票期权同时提供健康三餐，娱乐活动设施丰富，精彩building不间断。公司快速发展需要培养和激励脱颖而出的骨干成员3、 我们倡导精英团队，摒除大公司的冗杂人事，始终保持快速沟通的做事方式。每个方向保持很小的团队，保持干练扁平，没有通货膨胀的title，没有客套的称呼"
              },
              {
                "logo": "https://img2.bosszhipin.com/mcs/chatphoto/20160317/5d308646e6e4bc4e68d5f97a74c14dcda2d41b7cc34321f537d83206460d4ca6.jpg",
                "name": "欧那教育",
                "location": "普陀区长寿路137号财富时代大厦6楼",
                "type": "互联网教育",
                "size": "A轮",
                "employee": "100-400人",
                "hot": "app技术经理",
                "count": "50",
                "inc": "随着中外交流的不断深入，需要越来越多掌握小语种的高端人才，也有越来越多的中国人选择到德国、法国、俄罗斯、西班牙等国家留学。但小语种教育资源在地域上分配很不平衡，许多小语种学习者在周边找不到优秀的小语种老师，许多小型小语种培训学校受限于资源也无力研发真正高质量的课程。上海云兜网络科技有限公司旗下欧那教育，是国内最早开始在线小语种培训机构，首创“真人在线实时教学”的互联网学习模式，通过最有效的沉浸式学习，打破传统的外语培训“知识堆积”的学习模式。全球数十位语言专家和教育专家组成的欧那教研团队研发的适合中国人学习的“极致·地道·匠心独具”的小语种语课程，帮助中国人用最快捷有效的方式，达成外语水平的提升。优质的中外籍师资、经济实惠的价格和全球专家研发的专业小语种课程赢得了数千位小语种学习者的认可和好评。我们相信互联网平等开放的力量，相信用优质的课程、实惠的价格、真诚的服务，让数百万对小语种学习和生活怀抱着热爱和执着，渴望通过努力改变生活改变未来的普通人，从见证小小改变的发生，到实现大大的梦想：）"
              },
              {
                "logo": "https://img.bosszhipin.com/beijin/mcs/chatphoto/20180120/feecd69f373a2a8b1189df93a0f6fd84cfcd208495d565ef66e7dff9f98764da.jpg",
                "name": "领健信息",
                "location": "上海市浦东新区",
                "type": "互联网",
                "size": "B轮",
                "employee": "500人以上",
                "hot": "前端工程师",
                "count": "100",
                "inc": "上海领健信息技术有限公司创立于2015年5月，2015年8月获得顶级投资机构经纬中国天使投资，2016年1月完成A轮融资，丁香园领投，天使投资人经纬中国继续跟进。2016年8月完成A➕轮融资，复星领投。2017年9月完成B轮融资，投资方为复星集团。作为国内领先的口腔+互联网SaaS服务提供商，领健信息致力于以信息技术改造口腔医疗行业，通过连接医院、诊所、医生、患者、数据、第三方服务及供应链，提供以患者为中心，以医生、助理、护士、前台和管理者为主体，以诊疗时间轴为主线的『e看牙』口腔门诊数字化解决方案，产品覆盖口腔门诊管理(Dental Practice Management System)，电子病历(EMR)，CRM, 营销运营，牙科影像云，智能硬件，和面向医生和患者的移动应用 。公司致力于推进整个口腔行业的数字化发展进程，以成为中国最大的口腔+互联网服务平台为使命；公司秉承“专业、极致、创新”的信仰，坚持“客户至上，质量保证，契约精神，团队合作，不作恶”的价值观。领健信息基于强大的行业技术背景和互联网基因，凭借国际化口腔门诊管理系统研发经验，结合本土化医疗IT创新思想，重新构想（Re-imaging）口腔门诊数字化解决方案。领健信息创始人是连续创业者，具有持久的创业热情和信仰，拥有开阔的国际视野和丰富的本土医疗行业和互联网经验。领健信息产品和服务水平一直在行业中保持领跑位置，必将引领口腔数字化新生态，打开口腔+互联网新视野，通过技术和服务创新，为大众口腔保健保驾护航。领健信息核心团队来自微软，飞利浦医疗，大众点评，美团等著名外企和互联网公司，和北京大学口腔医学院，上海交通大学口腔医学院，第四军医大学口腔医学院等知名口腔院校。公司汇聚了在口腔临床领域深耕细作多年的口腔医学专家和医疗信息化领域的资深行业技术专家，以及极具天赋的互联网精英。"
              },
              {
                "logo": "https://img2.bosszhipin.com/mcs/chatphoto/20160220/6042752606dc6957d81c5f08f409db8e5e01c286644ac62b728b8918eb85ca28.jpg",
                "name": "平安银行",
                "location": "上海徐汇区平安大厦凯滨路206号",
                "type": "互联网",
                "size": "已上市",
                "employee": "10000人以上",
                "hot": "前端架构师",
                "count": "400",
                "inc": "平安银行，全称平安银行股份有限公司，是中国平安保险（集团）股份有限公司控股的一家跨区域经营的股份制商业银行，为中国大陆12家全国性股份制商业银行之一，总部位于广东省深圳市。中国平安保险（集团）股份有限公司（以下简称“中国平安”）及其控股子公司为平安银行的控股股东。"
              },
              {
                "logo": "https://www.lgstatic.com/thumbnail_160x160/i/image2/M00/2C/FA/CgoB5lowjbmAHxUGAAA2tROA4LA987.jpg",
                "name": "蘑菇租房",
                "location": "上海市静安区",
                "type": "互联网",
                "size": "C轮",
                "employee": "1000人以上",
                "hot": "IOS工程师",
                "count": "200",
                "inc": "一、平台概述：蘑菇租房是国内领先的真实租房平台，2014年蘑菇租房从品牌长租公寓起步，蘑菇租房的前身蘑菇公寓致力于为都市白领创造高品质居住生活。2015年初，蘑菇公寓转型租房平台。 截止2017年底，蘑菇租房已落地北京、上海、广州、深圳、杭州、南京、成都等全国17座城市，入驻平台的出租机构超过10000家，平台真实出租房源量超过200万间，租客规模近千万量级，市场地位遥遥领先。蘑菇租房以“专注解决租房行业痛点，用心打造极致租住体验”为企业使命，致力于通过新技术的探索和运用，建立和有效管理高质量的租房服务标准，以真房源推动租房产业正向发展。让租住更简单、更便捷、更安全。蘑菇租房连续获得IDG资本、中国平安、海通开元、韩国KTB、蚂蚁金服、云峰基金、巨人网络等多家国际知名投资机构的风险投资，备受资本市场认可。2017年3月，蘑菇租房与蚂蚁金服达成深度战略合作并获得了蚂蚁金服C轮战略投资，成为首家进入支付宝第三方应用“支付宝租房”频道的租房平台，同时借助蚂蚁金服输出的金融、技术、大数据、信用等资源，形成租房行业整体解决方案。2017年12月，蘑菇租房完成C+轮融资，由云锋基金领投，巨人网络集团与蚂蚁金服跟投，蘑菇租房希望通过互联网技术推动租房行业形成良性循环的生态环境，为整个社会带来极致的租住体验，以实现“成为3亿人最信赖的租房生活平台”的企业愿景。二、发展数据：2014年至今，蘑菇租房迅速发展，备受资本市场青睐。目前，平台汇聚超10000家出租机构，平台管理房源近200万间。蘑菇租房已在北京、上海、深圳、杭州、南京、天津、广州、成都、重庆、西安、郑州、武汉、苏州、厦门、合肥、青岛、东莞等全国17个城市成立分公司。三、产品服务：蘑菇租房为公寓商家提供智能公寓管理系统，由蘑菇租房自主研发的“蘑菇伙伴”公寓SaaS管理系统历经数百次迭代升级，实时将系统内的空置房源对外展示，“房源出租后自动下架”、“空出后自动上线展示”，确保了房源真实性。除了管理房源，蘑菇伙伴还对接了流量、电子合同、金融、支付、大数据、智能硬件等多元化的产品服务，构建租房行业全产业链深度管理方案，贯穿从录房到租后的所有环节。极大地帮助公寓商家提升效率、降低成本，并对接智能硬件、金融支持、电子合同等服务。蘑菇租房为租客提供真实租房平台。实现找房、签订电子租房合同、支付房租与水电煤等生活缴费、报修、投诉等全流程高效率的在线解决方案。"
              }
            ]
          }
      """);
    });
  }

  navCompanyDetail(Company company, int index) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new CompanyDetail(company);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation), child: child),
          );
        }
    ));
  }
}
