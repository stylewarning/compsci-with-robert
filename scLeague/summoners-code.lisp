(defstruct kda
  kills
  deaths
  assists)

(defstruct stats
  (ad 0)
  (ap 0))

(defstruct item
  name
  stats
  additional)

(defstruct summoner
  name
  role
  lane)

(defstruct summonerprofile
  summoner
  stats
  kda
  items)

(defun add-stats (a b)
  (make-stats :ad (+ (stats-ad a) (stats-ad b))
              :ap (+ (stats-ap a) (stats-ap b))))

(defun bad-stats (a b)
  (setf (stats-ad a) (+ (stats-ad a) (stats-ad b)))
  (setf (stats-ap a) (+ (stats-ap a) (stats-ap b))))

(defun calculate-stats (sp)
  (add-stats (summonerprofile-stats sp)
             (reduce (function add-stats) 
                     (mapcar (function item-stats) (summonerprofile-items sp))
                     :initial-value (make-stats :ad 0 :ap 0))))
 
(make-list 

(defun increase-kills (sp)
  (setf (kda-kills (summonerprofile-kda sp))
        (+ 1 (kda-kills (summonerprofile-kda sp)))))

(defun increase-deaths (sp)
  (incf (kda-deaths (summonerprofile-kda sp))))

(defun increase-assists (sp)
  (incf (kda-assists (summonerprofile-kda sp))))

(defparameter *zed* 
  (make-summonerprofile 
   :summoner (make-summoner :name "Zed" :role "Assassin" :lane "Middle")
   :stats (make-stats :ad 15 :ap 1)
   :kda (make-kda :kills 1 :deaths 0 :assists 2)
   :items nil))

(defparameter *azir* 
  (make-summonerprofile 
   :summoner (make-summoner :name "Azir" :role "Mage" :lane "Middle")
   :stats (make-stats :ad 1 :ap 17)
   :kda (make-kda :kills 3 :deaths 0 :assists 1)
   :items (list *Nashors*)))

(defparameter *Duskblade* 
  (make-item 
   :name "Duskblade of Draktharr"
   :stats (make-stats :ad 55 )
   :additional "10% CDR and +21 Lethality"))

(defparameter *Nashors*
  (make-item 
   :name "Nashor's Tooth"
   :stats (make-stats :ap 80)
   :additional "20% CDR and +15 Basic Attacks deal 15 bonus magic damage on hit."))

(defparameter *Morellonomicon*
  (make-item 
   :name "Morellonomicon"
   :stats (make-stats :ap 80)
   :additional "+300hp and +15 Spell Pen"))

(defparameter *Youmuus*
  (make-item 
   :name "Youmuu's Ghostblade"
   :stats (make-stats :ad 55)
   :additional "10% CDR and +18 Lethality"))

(defparameter *all-items*
  (list *nashors* *duskblade* *Youmuus* *Morellonomicon*))

(add-stats (item-stats *duskblade*) (item-stats *Nashors*))

(add-stats (summonerprofile-stats *zed*) (summonerprofile-stats *azir*))

;; item slots??
;; adding 2 slots in a profile using 2 items within the struct
;; how are the structures