



const store = Vuex.createStore({
    state: {},
    mutations: {},
    actions: {}
  });
  
  const app = Vue.createApp({
    data: () => ({
      skillsPage: false,
      minigamePage: false,
      skills: [],
      speed: null, 
      currentRepeat: 0,
      minigameType: "",
      Key: "",
      notificationShow: false,
      gainedSkillAmount: "",
      gainedSkill: "",
      backgroundImage:"",
      intervalId: null,
      position: 0, 
      direction: 1,
      currentHeight: 100,
      intervalId2: null,
      selectFree: false,
      notificationShowNormal: false,
      selectedSkill: "",
      selectedPrice: "",
      backgroundImage:"",
      weightSelect: false,
      skillImage: "",
      selectedWeight: 10,
      skills2: [],
      buyPopUp: false,
      selectedPercent: 0,
      totalPrice: 0,
      taskPage: false,
      tasks: [],
      caloriePerMeter: 5,
      currentUnit: '',
      freeMenu: false,
      keybind: false,
      countdown: 60,
      barWidth: '100%',
    }),
  
    methods: {
     
      selectWeight() {
        this.weightSelect = false;
        postNUI("exit");
      },
      getImageSrc(nme) {
        this.skillImage = nme
        if (this.skillImage == 'Stamina') {
          return './src/images/Stamina.png';
        } else if (this.skillImage == 'Strength') {
          return './src/images/Strength.png';
        } else if (this.skillImage == 'Shooting') {
          return './src/images/shooting.png';
        } else if (this.skillImage == 'Lung Capacity') {
          return './src/images/Lungs.png';
        } else if (this.skillImage == 'Driving') {
          return './src/images/driving.png';
        }
        return '';
      },
      selectSkills(skillp, pprice) {
        this.selectedSkill = skillp
        this.selectedPrice = pprice 
        this.buyPopUp = true;
      },
      buyPointsNow() {
        this.selectedPrice = this.selectedPrice * this.selectedPercent
        console.log(this.selectedPrice)
        postNUI("buySkill", { skill: this.selectedSkill, price: this.selectedPrice, percent: this.selectedPercent});
        this.buyPopUp = false;
      },
      closePopUp() {
        this.buyPopUp = false;
      },
      showNotificationNormal(skill, amount, duration) {
        this.gainedSkill = skill;
        this.gainedSkillAmount = amount;
        this.notificationShowNormal = true;
        
        setTimeout(() => {
          this.notificationShowNormal = false;
        }, duration);
      },
      moveLine() {
        if (this.minigamePage == true) {
              const line = this.$refs.line;
              const red1 = this.$refs.red1;
              const green1 = this.$refs.green1;
              const green2 = this.$refs.green2;
      
              const lineRect = line.getBoundingClientRect();
              const red1Rect = red1.getBoundingClientRect();
              const green1Rect = green1.getBoundingClientRect();
              const green2Rect = green2.getBoundingClientRect();

              if (
                  lineRect.top + lineRect.height >= red1Rect.top &&
                  lineRect.top <= red1Rect.top + red1Rect.height
              ) {
                postNUI("minigamePosition", { position: "red" });
                clearInterval(this.interval);
                this.speed = 120

              } else if (
                lineRect.top + lineRect.height >= green1Rect.top &&
                lineRect.top <= green1Rect.top + green1Rect.height
              ) {

              } else if (
                  lineRect.top + lineRect.height >= green2Rect.top &&
                  lineRect.top <= green2Rect.top + green2Rect.height
              ) {
                this.speed = 120
                  postNUI("minigamePosition", { position: "green" });
                  
              } else {
                postNUI("minigamePosition", { position: "space" });
              }
      
              const container = line.parentElement;
              const containerHeight = container.offsetHeight;
              const lineHeight = line.offsetHeight;
      
              this.position += this.direction;
      
              if (this.position >= containerHeight - lineHeight) {
                  this.position = containerHeight - lineHeight;
                  this.direction = -1;
              } else if (this.position <= 0) {
                  this.position = 0;
                  this.direction = 1;
              }
              line.style.top = this.position + "px";
        }
      },
      showNotification(skill, amount, duration) {
        this.gainedSkill = skill;
        this.gainedSkillAmount = amount;
        this.notificationShow = true;
        
        setTimeout(() => {
          this.notificationShow = false;
        }, duration);
      },
      startTask(index) {
        postNUI("getTask", { number: index });
        this.taskPage = false;
        postNUI("exit");
      },
      freeExercise(exerciseName) {
        postNUI("freeExercise", { exercise: exerciseName });
        this.freeMenu = false;
        postNUI("exit");
      },
     
    },
    
  
    computed: {

      isNormalWorkout() {
          return this.currentUnit === 'weight';
      },
      isTreadmill() {
          return this.currentUnit === 'distance';
      },
      estimatedCalorie() {
        return this.currentRepeat * this.caloriePerMeter;
      },
      sortedSkills() {
        return [...this.skills].sort((a, b) => b.current - a.current);
      }
    },
  
    mounted() {
      this.intervalId = setInterval(this.moveLine, 1000 / this.speed);
      window.addEventListener("message", (event) => {
        if (event.data.action == "SKILL_PAGE") {
          this.skillsPage = true
          this.skills = event.data.skills;
          this.skills.sort((a, b) => b.current - a.current);
          this.freeMenu = false;
        }
        if (event.data.action == "MINIGAME_DATA") {
          this.minigamePage = event.data.status;
          this.skillsPage = false;
          this.currentRepeat = event.data.currentRepeat;
          this.Key = event.data.minigameKey;
          this.currentUnit = event.data.unit;
          this.freeMenu = false;
          this.keybind = false;
        } 
        if (event.data.action == "SKILL_PAGE_CLOSE") {
          this.skillsPage = false;
          this.selectFree = false;
          this.freeMenu = false;
        }
        if (event.data.action == "NOTIFICATION") {
          this.showNotification(event.data.GainedSkill, event.data.GainedSkillAmount, event.data.notifstatus);
          this.showNotificationNormal(event.data.GainedSkill, event.data.GainedSkillAmount, event.data.notifstatus);
        }
        
        if (event.data.action == "SELECT_WEIGHT") {
          this.selectFree = false;
          this.skillsPage = false;
          this.weightSelect = true;
          this.freeMenu = false;
        }
        if (event.data.action == "TASKS") {
          this.tasks = event.data.tasks;
          this.taskPage = true;
          this.selectFree = false;
          this.skillsPage = false;
          this.weightSelect = false;
          this.freeMenu = false;
        }
        if (event.data.action == "FREE") {
          this.freeMenu = true;
          this.taskPage = false;
          this.selectFree = false;
          this.skillsPage = false;
          this.weightSelect = false;
        }
        if (event.data.action == "KEYBIND_OPEN") {
          this.keybind = true;
        } 
        if (event.data.action == "KEYBIND_CLOSE") {
          this.keybind = false;
        } 
      });

      window.addEventListener("message", this.handleMenuOpen);
      document.onkeyup = (data) => {
        if (data.which == 27) {
          this.skillsPage = false;
          this.selectFree = false;
          this.weightSelect = false;
          this.taskPage = false;
          this.freeMenu = false;
          this.keybind = false;
          postNUI("exit");

          return;
        }
      };
  
    },
  
    destroyed() {
  
    },
    beforeDestroy() {
      clearInterval(this.intervalId); 
    },
  });
  
  app.use(store).mount("#app");
  
  
  var resourceName = "0r-gym";
  
  if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
  }
  
  window.postNUI = async (name, data) => {
    try {
      const response = await fetch(`https://${resourceName}/${name}`, {
        method: "POST",
        mode: "cors",
        cache: "no-cache",
        credentials: "same-origin",
        headers: {
          "Content-Type": "application/json"
        },
        redirect: "follow",
        referrerPolicy: "no-referrer",
        body: JSON.stringify(data)
      });
  
      if (!response.ok) {

        return null;
      }
  
      const text = await response.text();
      if (!text) {

        return null;
      }
  
      // Try to parse the response body as JSON
      try {
        return JSON.parse(text);
      } catch (jsonError) {

        return null;
      }
  
    } catch (error) {

      return null;
    }
  };
  
  
  
  
  